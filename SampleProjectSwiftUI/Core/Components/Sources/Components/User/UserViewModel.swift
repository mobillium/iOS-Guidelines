//
//  UserViewModel.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 24.11.2022.
//

import Foundation
import Combine

public protocol UserViewProtocol: Identifiable {
    var id: UUID { get }
    var imageUrl: String { get }
    var username: String { get }
    var stat: String { get }
}

public struct UserViewModel: UserViewProtocol {
    public var id = UUID()
    public var imageUrl: String
    public var username: String
    public var stat: String
    
    public init(imageUrl: String, username: String, stat: String) {
        self.imageUrl = imageUrl
        self.username = username
        self.stat = stat
    }
}
