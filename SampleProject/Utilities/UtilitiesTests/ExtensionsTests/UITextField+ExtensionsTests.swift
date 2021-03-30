//
//  UITextField+ExtensionsTests.swift
//  UtilitiesTests
//
//  Created by Mehmet Salih Aslan on 29.03.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import XCTest
@testable import Utilities

class UITextFieldExtensionsTests: XCTestCase {
    
    func testTrimmedText() {
        let textField = UITextField()
        textField.text = " Salih "
        XCTAssertEqual("Salih", textField.trimmedText)
        
        textField.text = "\n\n Salih " + "Aslan\n\n"
        
        XCTAssertEqual("Salih Aslan", textField.trimmedText)
    }

}
