//
//  String+RangeTestCase.swift
//  SportsBuff-DemoTests
//
//  Created by Yevheniya Zaslavskaya on 3/7/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import XCTest

class String_RangeTestCase: XCTestCase {

    func testSubstringFromIndex() {
        //given
        let testString = "Hello, world!"
        
        //when
        let expected = "world!"
        
        //then
        let result = testString.substring(from: 7)
        XCTAssertEqual(result, expected)
    }
    
    func testSubstringWithRange() {
        //given
        let testString = "I love swift!"
        
        //when
        let expected = "swift"
        
        //then
        let result = testString.substring(with: 7..<12)
        XCTAssertEqual(result, expected)
    }
}
