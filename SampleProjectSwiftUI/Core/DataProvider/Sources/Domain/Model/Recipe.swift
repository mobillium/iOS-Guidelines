//
//  Recipe.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct Recipe: Identifiable {
    public let id: Int
    public let title: String?
    public let isEditorChoice: Bool
    public let likeCount: Int
    public let commentCount: Int
    public let user: User
    public let category: CategoryDetail
    public let images: [ImageModel]
    
    public init(id: Int,
                title: String?,
                isEditorChoice: Bool,
                likeCount: Int,
                commentCount: Int,
                user: User,
                category: CategoryDetail,
                images: [ImageModel]) {
        self.id = id
        self.title = title
        self.isEditorChoice = isEditorChoice
        self.likeCount = likeCount
        self.commentCount = commentCount
        self.user = user
        self.category = category
        self.images = images
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case isEditorChoice = "is_editor_choice"
        case likeCount = "like_count"
        case commentCount = "comment_count"
        case user
        case category
        case images
    }
}
