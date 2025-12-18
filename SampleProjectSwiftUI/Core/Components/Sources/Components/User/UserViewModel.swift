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
    var imageUrl: String? { get }
    var username: String? { get }
    var stat: String { get }
    var imageSize: UserViewImageSize { get }
}

public struct UserViewModel: UserViewProtocol {
    public var id = UUID()
    public var imageUrl: String?
    public var username: String?
    public var stat: String
    public var imageSize: UserViewImageSize
    
    public init(imageUrl: String?, username: String?, stat: String, imageSize: UserViewImageSize? = nil) {
        self.imageUrl = imageUrl
        self.username = username
        self.stat = stat
        self.imageSize = imageSize ?? .large
    }
}

public enum UserViewImageSize {
    case small
    case large
    
    var cgFloatValue: CGFloat {
        switch self {
        case .small:
            24
        case .large:
            40
        }
    }
}
