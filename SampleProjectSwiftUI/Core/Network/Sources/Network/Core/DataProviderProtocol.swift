//
//  DataProviderProtocol.swift
//  Network
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public typealias DecodableResult<T: Decodable> = Result<T, Error>

public protocol DataProviderProtocol {
    func request<T: DecodableResponseRequest>(for request: T) async -> DecodableResult<T.ResponseType>
}
