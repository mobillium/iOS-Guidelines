//
//  APILogger.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 15.11.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Alamofire
import Foundation

public final class APILogger: EventMonitor {
    
    public static let shared = APILogger()
    
    public let queue = DispatchQueue(label: "com.mobillium.sampleproject.networklogger")
    
    public func request(_ request: Request, didCreateURLRequest urlRequest: URLRequest) {
        print("---> Request Created <---")
        print(request.description)
    }
    
    public func requestDidFinish(_ request: Request) {
        print("---> Request Finished <---")
        print(request.description)
    }
    
    public func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("---> Request JSONResponse <---")
        if let data = response.data, let json = String(data: data, encoding: .utf8) {
            print(json)
        }
    }
}
