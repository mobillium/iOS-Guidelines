//
//  MockDataProvider.swift
//  DataProviderTests
//
//  Created by Mehmet Salih Aslan on 29.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

class MockDataProvider: DataProviderProtocol {
    
    func request<T>(for request: T, result: DataProviderResult<T.ResponseType>?) where T: DecodableResponseRequest {
        debugPrint("mockFileName: \(request.mockFileName)")
        let bundle = Bundle(for: type(of: self))
        do {
            guard
                let path = bundle.path(forResource: request.mockFileName, ofType: "json")
            else {
                throw NSError(domain: "DataProviderTests", code: 0, userInfo: [NSLocalizedDescriptionKey: "The json file not be found."])
            }
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            decoder.dataDecodingStrategy = .deferredToData
            let response = try decoder.decode(T.ResponseType.self, from: data)
            result?(.success(response))
        } catch {
            result?(.failure(error))
        }
    }
}
