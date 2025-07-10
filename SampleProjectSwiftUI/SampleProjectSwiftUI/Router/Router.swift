//
//  Router.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 19.02.2024.
//

import SwiftUI

class AnyIdentifiable: Identifiable {
    let destination: any Identifiable
    
    init(destination: any Identifiable) {
        self.destination = destination
    }
}

final class Router: ObservableObject {
    @Published public var navPath = NavigationPath()
    @Published public var presentedSheet: AnyIdentifiable?
    
    init() {}
    
    func presentSheet(destination: any Identifiable) {
        presentedSheet = AnyIdentifiable(destination: destination)
    }
    
    func navigate(to destination: any Hashable) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
