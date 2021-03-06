//
//  DefaultsKeys.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 5.02.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import MobilliumUserDefaults

extension DefaultsKey {
    static let stringKey = Key<String>(key: "stringKey")
    static let isWalkThroughCompleted = Key<Bool>(key: "isWalkThroughCompleted")
    static let userId = Key<Int>(key: "userId")
}
