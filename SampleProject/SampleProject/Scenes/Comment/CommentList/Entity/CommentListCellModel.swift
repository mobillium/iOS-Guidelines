//
//  CommentListCellModel.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 11.08.2022.
//  Copyright © 2022 Mobillium. All rights reserved.
//

import MobilliumUserDefaults

class CommentListCellModel: CommentCellProtocol {
    
    let commentId: Int
    let userId: Int
    var imageUrl: String?
    var username: String?
    var userFollowerCount: Int
    var userRecipeCount: Int
    var userRecipeAndFollowerCountText: String? {
        return Localizable.CommentList.userStats(userRecipeCount, userFollowerCount)
    }
    var timeDifferenceText: String?
    var commentText: String?
    var isOwner: Bool
    var moreButtonTapped: VoidClosure?
    var commentTextDidChanged: VoidClosure?
    
    public init(comment: RecipeComment) {
        self.userId = comment.user.id
        self.imageUrl = comment.user.image?.url
        self.username = comment.user.username
        self.userFollowerCount = comment.user.followedCount
        self.userRecipeCount = comment.user.recipeCount
        
        let isOwner = comment.user.id == DefaultsKey.userId.value
        self.commentId = comment.id
        self.timeDifferenceText = comment.timeDifference
        self.commentText = comment.text
        self.isOwner = isOwner
    }
    
}
