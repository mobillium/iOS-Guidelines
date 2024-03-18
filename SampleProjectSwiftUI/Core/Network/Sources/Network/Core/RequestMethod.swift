//
//  RequestMethod.swift
//  Network
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

public enum RequestMethod: String {
    /// `CONNECT` method.
    case connect = "CONNECT"
    /// `DELETE` method.
    case delete = "DELETE"
    /// `GET` method.
    case get = "GET"
    /// `HEAD` method.
    case head = "HEAD"
    /// `OPTIONS` method.
    case options = "OPTIONS"
    /// `PATCH` method.
    case patch = "PATCH"
    /// `POST` method.
    case post = "POST"
    /// `PUT` method.
    case put = "PUT"
    /// `TRACE` method.
    case trace = "TRACE"
}
