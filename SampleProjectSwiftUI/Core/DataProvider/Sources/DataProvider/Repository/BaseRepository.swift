//
//  BaseRepository.swift
//
//
//  Created by Mehmet Salih Aslan on 2.02.2024.
//

import Foundation
import Network
import Domain

// swiftlint:disable line_length
public protocol BaseRepositoryProtocol {
    var dataProvider: DataProviderProtocol { get }
    
    func decodableResponse<T: DecodableResponseRequest>(request: T) async -> DecodableResult<T.ResponseType>
    func networkResponse<T: DecodableResponseRequest, M: ResponseMappable>(request: T, mapper: M) async -> NetworkResult<M.DomainType> where T.ResponseType == M.ResponseType
}

public extension BaseRepositoryProtocol {
    func decodableResponse<T: DecodableResponseRequest>(request: T) async -> DecodableResult<T.ResponseType> {
        let result = await dataProvider.request(for: request)
        return result
    }
    
    func networkResponse<T: DecodableResponseRequest, M: ResponseMappable>(request: T, mapper: M ) async -> DomainResult<M.DomainType> where
    T.ResponseType == M.ResponseType {
        let result = await dataProvider.request(for: request, mapper: mapper)
        return result
    }
    
}

public class BaseRepository: BaseRepositoryProtocol {
    
    public let dataProvider: DataProviderProtocol
    
    public init(dataProvider: DataProviderProtocol) {
        self.dataProvider = dataProvider
    }
}
// swiftlint:enable line_length
