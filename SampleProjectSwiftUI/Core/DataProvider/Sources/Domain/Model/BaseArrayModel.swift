//
//  BaseArrayModel.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 31.07.2025.
//

public struct BaseArrayModel<T> {
    public let data: [T]
    public let pagination: Pagination
    
    public init(data: [T], pagination: Pagination) {
        self.data = data
        self.pagination = pagination
    }
}
