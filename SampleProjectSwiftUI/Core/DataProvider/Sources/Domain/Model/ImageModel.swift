//
//  ImageModel.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Foundation

public struct ImageModel: Identifiable {
    public let id = UUID()
    public let url: String?
    
    public init(url: String?) {
        self.url = url
    }
}
