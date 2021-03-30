//
//  Int+ExtensionsTests.swift
//  UtilitiesTests
//
//  Created by Mehmet Salih Aslan on 29.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import XCTest

class IntExtensionsTests: XCTestCase {

    func testToString() {
        let number = 100
        XCTAssertEqual("100", number.toString)
        
        let number1 = 100_000
        XCTAssertEqual("100000", number1.toString)
    }

}
