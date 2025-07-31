//
//  LogoutRequest.swift
//  DataProvider
//
//  Created by Mehmet Salih Aslan on 25.03.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Network

struct LogoutRequest: APIDecodableResponseRequest {
    
    typealias ResponseType = SuccessResponse

    var path: String = "auth/logout"
    var method: RequestMethod = .post
    
    init() {}
}
