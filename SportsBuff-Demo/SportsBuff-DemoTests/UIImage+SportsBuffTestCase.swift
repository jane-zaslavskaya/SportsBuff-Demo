//
//  UIImage+SportsBuffTestCase.swift
//  SportsBuff-DemoTests
//
//  Created by Yevheniya Zaslavskaya on 3/7/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import XCTest

class UIImage_SportsBuffTestCase: XCTestCase {
    
    func testImageFromIdentifier() {
        //given
        let testIdentifier = "time"
        
        //when
        let expected = UIImage(.time)
        
        //then
        let result = UIImage(named: testIdentifier)
        XCTAssertEqual(result, expected)
    }
}
