//
//  Auth.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct Auth: Decodable {
    public let token: String
    public let user: User
}
