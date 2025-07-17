//
//  DestinationProtocol.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 10.07.2025.
//

import SwiftUI

protocol DestinationProtocol: Hashable, Equatable {
    associatedtype DestinationView: View
    
    @ViewBuilder var view: DestinationView { get }
}

extension DestinationProtocol {
    
    func hash(into hasher: inout Hasher) {
        let typeString = String(describing: Self.self)
        let caseString = String(describing: self)
        hasher.combine(typeString)
        hasher.combine(caseString)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        let typeCheck = String(describing: lhs.self) == String(describing: rhs.self)
        let caseCheck = String(describing: lhs) == String(describing: rhs)
        return typeCheck && caseCheck
    }
}

extension View {
    
    func navigationDestination<D: DestinationProtocol>(for destination: D.Type) -> some View {
        return self.navigationDestination(for: destination.self, destination: { destination in
            destination.view
        })
    }
}
