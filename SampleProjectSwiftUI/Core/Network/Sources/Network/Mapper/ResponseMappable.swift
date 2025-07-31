//
//  Untitled.swift
//  Network
//
//  Created by Mehmet Salih Aslan on 24.07.2025.
//

import Foundation

public protocol ResponseMappable {
    associatedtype ResponseType: Decodable
    associatedtype DomainType

    func map(from response: ResponseType) -> DomainType
    func map(from response: ResponseType?) -> DomainType?
}

// MARK: - Optional Mapping
public extension ResponseMappable {
    func map(from response: ResponseType?) -> DomainType? {
        guard let response else { return nil }
        return self._mapFromNonOptional(response)
    }

    private func _mapFromNonOptional(_ response: ResponseType) -> DomainType {
        map(from: response)
    }
}

// MARK: - List Mapping
public extension ResponseMappable {
    func mapList(from responses: [ResponseType]) -> [DomainType] {
        return responses.map { map(from: $0) }
    }

    func mapList(from responses: [ResponseType?]) -> [DomainType] {
        return responses.compactMap { response in
            map(from: response)
        }
    }
}
