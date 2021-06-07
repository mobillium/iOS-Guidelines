//
//  CommentCellModel.swift
//  UIComponents
//
//  Created by Murat Celebi on 25.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Foundation

public protocol CommentCellDataSource: AnyObject {
    var userId: Int { get }
    var imageUrl: String? { get }
    var username: String? { get }
    var recipeAndFollowerCountText: String? { get }
    var timeDifferenceText: String? { get }
    var commentId: Int { get }
    var commentText: String? { get set }
}

public protocol CommentCellEventSource: AnyObject {
    var moreButtonTapped: VoidClosure? { get set }
    var commentTextDidChanged: VoidClosure? { get set }
}

public protocol CommentCellProtocol: CommentCellDataSource, CommentCellEventSource {}

public final class CommentCellModel: CommentCellProtocol {
    public var userId: Int
    public var imageUrl: String?
    public var username: String?
    public var recipeAndFollowerCountText: String?
    public var timeDifferenceText: String?
    public var commentId: Int
    public var commentText: String?
    public var moreButtonTapped: VoidClosure?
    public var commentTextDidChanged: VoidClosure?

    public init(userId: Int,
                imageUrl: String?,
                username: String?,
                recipeAndFollowerCountText: String?,
                timeDifferenceText: String?,
                commentId: Int,
                commentText: String?) {
        self.userId = userId
        self.imageUrl = imageUrl
        self.username = username
        self.recipeAndFollowerCountText = recipeAndFollowerCountText
        self.timeDifferenceText = timeDifferenceText
        self.commentId = commentId
        self.commentText = commentText
    }
}
