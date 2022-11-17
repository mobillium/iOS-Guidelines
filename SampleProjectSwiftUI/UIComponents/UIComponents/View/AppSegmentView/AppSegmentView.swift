//
//  AppSegmentView.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 17.11.2022.
//

import SwiftUI

public struct AppSegmentView: View {
    
    @Binding var selectedIndex: Int
    @Binding var options: [String]
    
    public init(selectedIndex: Binding<Int>, options: Binding<[String]>) {
        self._selectedIndex = selectedIndex
        self._options = options
    }
    
    public var body: some View {
        HStack(spacing: 1) {
            ForEach(options.indices, id: \.self) { index in
                let isSelected = selectedIndex == index
                ZStack {
                    
                    Text(options[index])
                        .foregroundColor(isSelected ? Color.appRed : Color.appCinder)
                        .font(.font(.nunitoBold, size: .medium))
                    
                    VStack {
                        
                        Spacer()
                        
                        HStack {
                            Rectangle()
                                .cornerRadius(1)
                                .foregroundColor(Color.clear)
                            
                            Rectangle()
                                .cornerRadius(1)
                                .foregroundColor(isSelected ? Color.appRed : Color.clear)
                            
                            Rectangle()
                                .cornerRadius(1)
                                .foregroundColor(Color.clear)
                            
                        }
                        .frame(height: 2)
                    }
                    
                }
                .background(Color.appPrimaryBackground)
                .onTapGesture {
                    self.selectedIndex = index
                }
                
            }
        }
        .background(Color.appSeparator)
        .frame(height: 46)
    }
}

struct AppSegmentView_Previews: PreviewProvider {
    
    static var previews: some View {
        @State var selectedIndex = 0
        @State var options = ["Title 1", "Title 2"]
        let view = AppSegmentView(selectedIndex: $selectedIndex, options: $options)
        return view
    }
}
