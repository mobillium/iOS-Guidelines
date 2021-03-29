//
//  String+ExtensionsTests.swift
//  UtilitiesTests
//
//  Created by Mehmet Salih Aslan on 29.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import XCTest
@testable import Utilities

class String_ExtensionsTests: XCTestCase {
    
    func testTrim()  {
        var string = " Salih "
        XCTAssertEqual("Salih", string.trim)
        
        string = "\n\n Salih " + "Aslan\n\n"
        
        XCTAssertEqual("Salih Aslan", string.trim)
    }
    
}
