//
//  BaseModel.swift
//  DataProvider
//
//  Created by Murat Celebi on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public struct BaseModel<T> {
    public let data: T
    
    public init(data: T) {
        self.data = data
    }
}
