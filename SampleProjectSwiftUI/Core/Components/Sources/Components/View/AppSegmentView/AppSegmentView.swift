//
//  AppSegmentView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 17.11.2022.
//

import SwiftUI

public struct AppSegmentView: View {
    
    @State var spearatorLeading: CGFloat = 0
    @State var separatorWidth: CGFloat = 0
    @State var containerWidth: CGFloat = 0
    @Binding var selectedIndex: Int
    @Binding var options: [String]
    
    public init(selectedIndex: Binding<Int>, options: Binding<[String]>) {
        self._selectedIndex = selectedIndex
        self._options = options
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack(spacing: 1) {
                    ForEach(options.indices, id: \.self) { index in
                        let isSelected = selectedIndex == index
                        ZStack {
                            HStack {
                                Spacer()
                                Text(options[index])
                                    .foregroundColor(isSelected ? Color.appPrimary : Color.appFocus)
                                    .font(.font(.nunitoBold, size: .medium))
                                    .padding()
                                Spacer()
                            }
                        }
                        .background(Color.appPureWhite)
                        .onTapGesture {
                            self.selectedIndex = index
                            self.calculateSeparatorLeading(geometry: geometry, selectedIndex: index)
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Rectangle()
                            .foregroundColor(Color.appPrimary)
                            .frame(width: separatorWidth, height: 2)
                            .offset(x: spearatorLeading, y: 0)
                        Spacer()
                    }
                    .frame(height: 2)
                }
                .onAppear {
                    DispatchQueue.main.async {
                        self.containerWidth = geometry.size.width
                        calculateSeparatorWidth(geometry: geometry)
                    }
                }
                
            }
            .onAppear {
                DispatchQueue.main.async {
                    self.containerWidth = geometry.size.width
                    calculateSeparatorLeading(geometry: geometry, selectedIndex: selectedIndex)
                }
            }
        }
        .background(Color.appElevation2)
        .frame(height: 46)
        .onChange(of: selectedIndex) { newValue in
            let segmentCount = options.count.toCGFloat
            let width = containerWidth - (segmentCount - 1)
            let separatorWidth = width / segmentCount
            withAnimation(.linear(duration: 0.25)) {
                spearatorLeading = (newValue.toCGFloat * separatorWidth) + (separatorWidth / 3) + newValue.toCGFloat * 1
            }
        }
    }
    
    private func calculateSeparatorWidth(geometry: GeometryProxy) {
        let segmentCount = options.count.toCGFloat
        let width = geometry.size.width - (segmentCount - 1)
        let separatorWidth = (width / segmentCount) / 3
        self.separatorWidth = separatorWidth
    }
    
    private func calculateSeparatorLeading(geometry: GeometryProxy, selectedIndex: Int) {
        let segmentCount = options.count.toCGFloat
        let width = geometry.size.width - (segmentCount - 1)
        let separatorWidth = width / segmentCount
        withAnimation(.linear(duration: 0.25)) {
            spearatorLeading = (selectedIndex.toCGFloat * separatorWidth) + (separatorWidth / 3) + selectedIndex.toCGFloat * 1
        }
    }
}

struct AppSegmentView_Previews: PreviewProvider {
    
    static var previews: some View {
        @State var selectedIndex = 0
        @State var options = ["Title 1", "Title 2", "Title 3", "Title 4"]
        let view = AppSegmentView(selectedIndex: $selectedIndex, options: $options)
        return view
    }
}
