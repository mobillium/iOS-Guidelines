//
//  DataProvider.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 15.11.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import Alamofire
import DataProvider

#if DEBUG
let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared)
#else
let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared)
#endif
