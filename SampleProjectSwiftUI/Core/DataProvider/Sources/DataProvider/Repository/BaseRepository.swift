//
//  BaseRepository.swift
//
//
//  Created by Mehmet Salih Aslan on 2.02.2024.
//

import Foundation
import Network

public protocol BaseRepositoryProtocol {
    var dataProvider: DataProviderProtocol { get }
    
    func decodableResponse<T: DecodableResponseRequest>(request: T) async -> DecodableResult<T.ResponseType>
}

public extension BaseRepositoryProtocol {
    func decodableResponse<T: DecodableResponseRequest>(request: T) async -> DecodableResult<T.ResponseType> {
        let result = await dataProvider.request(for: request)
        return result
    }
}

public class BaseRepository: BaseRepositoryProtocol {
    
    public let dataProvider: DataProviderProtocol
    
    public init(dataProvider: DataProviderProtocol) {
        self.dataProvider = dataProvider
    }
}
