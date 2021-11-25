//
//  CommentCellModel+Extensions.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 15.11.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import MobilliumUserDefaults

extension CommentCellModel {
    
    convenience init(comment: RecipeComment) {
        let recipeAndFollowerCountText = "\(comment.user.recipeCount) \(L10n.General.recipe) \(comment.user.followedCount) \(L10n.General.follower)"
        let isOwner = comment.user.id == DefaultsKey.userId.value
        self.init(userId: comment.user.id,
                  imageUrl: comment.user.image?.url,
                  username: comment.user.username,
                  recipeAndFollowerCountText: recipeAndFollowerCountText,
                  timeDifferenceText: comment.timeDifference,
                  commentId: comment.id,
                  commentText: comment.text,
                  isOwner: isOwner)
    }
}
