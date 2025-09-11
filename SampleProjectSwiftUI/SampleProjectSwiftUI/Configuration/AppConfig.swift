//
//  AppConfig.swift
//  SampleProjectSwiftUI
//
//  Created by Mehmet Salih Aslan on 11.09.2025.
//

import Foundation

enum AppConfig {
    private static var info: [String: Any] {
        Bundle.main.infoDictionary ?? [:]
    }

    static var apiBaseURL: String {
        info["APIBaseURL"] as? String ?? ""
    }
}
