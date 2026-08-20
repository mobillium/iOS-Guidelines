import SwiftUI
import UIKit

public struct ToastButton {
    public let title: String
    public let tint: Color
    public let action: () -> Void

    public init(title: String, tint: Color = .appPrimary, action: @escaping () -> Void) {
        self.title = title
        self.tint = tint
        self.action = action
    }
}

public struct ToastValue: Identifiable {
    public let id = UUID()
    public let icon: Image?
    public let message: String
    public let button: ToastButton?

    public init(icon: Image? = nil, message: String, button: ToastButton? = nil) {
        self.icon = icon
        self.message = message
        self.button = button
    }
}

public enum ToastPosition {
    case top
    case bottom
}

@MainActor
public final class ToastManager: ObservableObject {
    @Published fileprivate private(set) var currentToast: ToastValue?

    private var dismissTask: Task<Void, Never>?
    private var toastWindow: UIWindow?

    public init() {}

    public func present(_ toast: ToastValue, duration: TimeInterval = 3) {
        dismissTask?.cancel()
        withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
            currentToast = toast
        }
        showToastWindow()

        dismissTask = Task { [weak self] in
            let nanoseconds = UInt64(max(duration, 0) * 1_000_000_000)
            try? await Task.sleep(nanoseconds: nanoseconds)
            guard !Task.isCancelled else { return }
            await self?.dismiss()
        }
    }

    public func dismiss() {
        dismissTask?.cancel()
        dismissTask = nil
        withAnimation(.easeOut(duration: 0.2)) {
            currentToast = nil
        }
        hideToastWindow()
    }

    private func showToastWindow() {
        guard let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive }) else {
            return
        }

        if toastWindow == nil {
            let window = UIWindow(windowScene: windowScene)
            window.windowLevel = .alert - 1
            window.backgroundColor = .clear
            let hostingController = UIHostingController(
                rootView: ToastWindowContent(manager: self)
            )
            hostingController.view.backgroundColor = .clear
            window.rootViewController = hostingController
            toastWindow = window
        }

        toastWindow?.isHidden = false
    }

    private func hideToastWindow() {
        toastWindow?.isHidden = true
    }
}

private struct PresentToastKey: EnvironmentKey {
    static let defaultValue: (ToastValue) -> Void = { _ in }
}

public extension EnvironmentValues {
    var presentToast: (ToastValue) -> Void {
        get { self[PresentToastKey.self] }
        set { self[PresentToastKey.self] = newValue }
    }
}

private struct ToastHostModifier: ViewModifier {
    @StateObject private var manager = ToastManager()

    func body(content: Content) -> some View {
        content
            .environment(\.presentToast) { toast in
                manager.present(toast)
            }
    }
}

public extension View {
    func installToast(position: ToastPosition = .bottom) -> some View {
        modifier(ToastHostModifier())
    }
}

private struct ToastWindowContent: View {
    @ObservedObject var manager: ToastManager

    var body: some View {
        VStack {
            Spacer()

            if let toast = manager.currentToast {
                ToastView(toast: toast, dismiss: manager.dismiss)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 12)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .background(Color.clear)
        .ignoresSafeArea()
    }
}

private struct ToastView: View {
    let toast: ToastValue
    let dismiss: () -> Void
    @State private var dragOffset: CGFloat = .zero

    var body: some View {
        HStack(spacing: 12) {
            if let icon = toast.icon {
                icon
                    .font(.title3)
                    .accessibilityHidden(true)
            }

            Text(toast.message)
                .font(.body)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)

            if let button = toast.button {
                Button(button.title) {
                    button.action()
                    dismiss()
                }
                .font(.subheadline.weight(.semibold))
                .foregroundColor(button.tint)
            }
        }
        .foregroundColor(.primary)
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.16), radius: 12, y: 5)
        .offset(y: dragOffset)
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragOffset = value.translation.height
                }
                .onEnded { value in
                    if abs(value.translation.height) > 40 {
                        dismiss()
                    } else {
                        withAnimation(.spring(response: 0.25, dampingFraction: 0.8)) {
                            dragOffset = .zero
                        }
                    }
                }
        )
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isStaticText)
    }
}
