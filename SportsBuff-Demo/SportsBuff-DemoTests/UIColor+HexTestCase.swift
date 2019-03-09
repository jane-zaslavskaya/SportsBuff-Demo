//
//  UIColor+HexTestCase.swift
//  SportsBuff-DemoTests
//
//  Created by Yevheniya Zaslavskaya on 3/7/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import XCTest

class UIColor_HexTestCase: XCTestCase {
    
    func testColorFromHex() {
        //given
        let red: CGFloat = 255 / 255
        let green: CGFloat = 127 / 255
        let blue: CGFloat = 80 / 255
        
        //when
        let expected = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        //then
        let result = UIColor(hexString: "ff7f50")
        XCTAssertEqual(result, expected)
    }
}
