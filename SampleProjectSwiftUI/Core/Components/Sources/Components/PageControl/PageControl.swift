//
//  PageControl.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 6.10.2022.
//

import SwiftUI
import UIKit

public struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    public init(numberOfPages: Int, currentPage: Binding<Int>) {
        self.numberOfPages = numberOfPages
        self._currentPage = currentPage
    }
    
    public func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return control
    }
    
    public func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // This is where old paradigm located
    public class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
