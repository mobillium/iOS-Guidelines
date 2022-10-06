//
//  CommentCellModel.swift
//  UIComponents
//
//  Created by Murat Celebi on 25.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

public protocol CommentCellDataSource: AnyObject {
    var imageUrl: String? { get }
    var username: String? { get }
    var userFollowerCount: Int { get }
    var userRecipeCount: Int { get }
    var userRecipeAndFollowerCountText: String? { get }
    var timeDifferenceText: String? { get }
    var commentText: String? { get set }
    var isOwner: Bool { get set }
}

public protocol CommentCellEventSource: AnyObject {
    var moreButtonTapped: VoidClosure? { get set }
    var commentTextDidChanged: VoidClosure? { get set }
}

public protocol CommentCellProtocol: CommentCellDataSource, CommentCellEventSource {}

