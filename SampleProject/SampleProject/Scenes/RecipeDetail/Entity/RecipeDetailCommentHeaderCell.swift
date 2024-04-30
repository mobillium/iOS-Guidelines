//
//  RecipeDetailCommentHeaderCell.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 11.08.2022.
//  Copyright © 2022 Mobillium. All rights reserved.
//

 final class RecipeDetailCommentHeaderCell: RecipeHeaderCellProtocol {
    var imageUrl: String
    var isEditorChoice: Bool
    
    init?(imageUrl: String?, isEditorChoice: Bool) {
        guard let imageUrl = imageUrl else {
            return nil
        }
        self.imageUrl = imageUrl
        self.isEditorChoice = isEditorChoice
    }
}
