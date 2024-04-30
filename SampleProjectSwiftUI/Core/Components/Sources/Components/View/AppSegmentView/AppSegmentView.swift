//
//  AppSegmentView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 17.11.2022.
//

import SwiftUI

public struct AppSegmentView: View {
    
    @State var spearatorLeading: CGFloat = 0
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
                                    .foregroundColor(isSelected ? Color.appRed : Color.appCinder)
                                    .font(.font(.nunitoBold, size: .medium))
                                    .padding()
                                Spacer()
                            }
                        }
                        .background(Color.appPrimaryBackground)
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
                            .cornerRadius(1)
                            .foregroundColor(Color.appRed)
                            .frame(width: getSeparatorWidth(geometry: geometry), height: 2)
                            .offset(x: spearatorLeading, y: 0)
                        Spacer()
                    }
                    .frame(height: 2)
                }

            }
            .onAppear {
                self.calculateSeparatorLeading(geometry: geometry, selectedIndex: selectedIndex)
            }
        }
        .background(Color.appSeparator)
        .frame(height: 46)
    }
    
    private func getSeparatorWidth(geometry: GeometryProxy) -> CGFloat {
        let segmentCount = options.count.toCGFloat
        let width = geometry.size.width - (segmentCount - 1)
        let separatorWidth = (width / segmentCount) / 3
        return separatorWidth
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
