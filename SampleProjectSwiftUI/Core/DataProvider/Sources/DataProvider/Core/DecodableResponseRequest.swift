//
//  DecodableResponseRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 12.11.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
