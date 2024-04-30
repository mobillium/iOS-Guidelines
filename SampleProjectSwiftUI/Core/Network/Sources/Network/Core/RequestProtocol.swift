//
//  RequestProtocol.swift
//  Network
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var queryParameters: RequestParameters { get }
    var bodyParameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: RequestEncoding { get }
    var url: String { get }
}
