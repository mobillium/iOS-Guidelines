//
//  DataProviderProtocol.swift
//  Network
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public typealias DecodableResult<T: Decodable> = Result<T, Error>
public typealias NetworkResult<T> = Result<T, Error>

// swiftlint:disable line_length
public protocol DataProviderProtocol {
    var networkLogger: NetworkLogger? { get }
    
    func request<T: DecodableResponseRequest>(for request: T) async -> DecodableResult<T.ResponseType>
    func request<T: DecodableResponseRequest, M: ResponseMappable>(for request: T, mapper: M) async -> NetworkResult<M.DomainType> where M.ResponseType == T.ResponseType
}
// swiftlint:enable line_length
