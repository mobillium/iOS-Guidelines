//
//  BaseResponse.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct BaseResponse<T: Decodable>: Decodable {
    public let data: T
    public let pagination: Pagination
}
