//
//  LayoutHelperTestCase.swift
//  SportsBuff-DemoTests
//
//  Created by Yevheniya Zaslavskaya on 3/7/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import XCTest

class LayoutHelperTestCase: XCTestCase {

    func testGettingBigSegmentFrame() {
        //given
        let helper = LayoutHelper(with: 200, insets: InterItem(vertical: 2.0, horizontal: 3.0))
        
        //when
        let lastFrame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 200 * 2 / 3.0))
        let expected = CGRect(origin: CGPoint(x: 0, y: 200 * 2 / 3.0 + 2.0), size: CGSize(width: 200, height: 200 * 2/3.0))
        
        //then
        let result = helper.getBigSegmentFrame(lastFrame: lastFrame)
        XCTAssertEqual(result, expected)
    }
    
    func testGettingSmallSegmentFrame() {
        //given
        let helper = LayoutHelper(with: 450, insets: InterItem(vertical: 3.0, horizontal: 5.0))
        
        //when
        let lastFrame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 450, height: 450 / 3.0))
        let expected = CGRect(origin: CGPoint(x: 0, y: 450 / 3.0 + 3.0), size: CGSize(width: 450, height: 450 / 3.0))
        
        //then
        let result = helper.getSmallSegmentFrame(lastFrame: lastFrame)
        XCTAssertEqual(result, expected)
    }
}
