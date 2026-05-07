//
//  HomeSheetDestinations.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 16.04.2026.
//

import SwiftUI

enum HomeSheetDestinations: SheetDestinationProtocol {
    case auth
    
    @MainActor
    @ViewBuilder
    var view: some View {
        switch self {
        case .auth:
            AuthNavigationScene()
        }
    }
}
