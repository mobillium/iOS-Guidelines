//
//  AuthSheetDestinations.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 18.06.2026.
//

import SwiftUI

enum AuthSheetDestinations: SheetDestinationProtocol {
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
