//
//  CGRect+ExtensionTestCase.swift
//  SportsBuff-DemoTests
//
//  Created by Yevheniya Zaslavskaya on 3/7/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import XCTest

class CGRect_ExtensionTestCase: XCTestCase {

    func testSliceEquallyHorizontal() {
        //given
        let frame = CGRect(x: 0, y: 0, width: 350, height: 600)
        let count = 2
        let edge = CGRectEdge.minXEdge
        let insets = InterItem(vertical: 5, horizontal: 5)
        
        //when
        let firstFrame = CGRect(x: 0, y: 0, width: 172.5, height: 600)
        let secondFrame = CGRect(x: 172.5 + 5, y: 0, width: 172.5, height: 600)
        let expected = [firstFrame, secondFrame]
        
        //then
        let result = frame.sliceEqually(count: count, from: edge, with: insets)
        XCTAssertEqual(result, expected)
    }
    
    func testSliceEquallyVertical() {
        //given
        let frame = CGRect(x: 0, y: 0, width: 200, height: 500)
        let count = 4
        let edge = CGRectEdge.minYEdge
        let insets = InterItem(vertical: 2, horizontal: 2)
        
        //when
        let firstFrame = CGRect(x: 0, y: 0, width: 200, height: 123.5)
        let secondFrame = CGRect(x: 0, y: 123.5 + 2, width: 200, height: 123.5)
        let thirdFrame = CGRect(x: 0, y: 123.5 + 2 + 123.5 + 2, width: 200, height: 123.5)
        let fourthFrame = CGRect(x: 0, y:  123.5 + 2 + 123.5 + 2 + 123.5 + 2, width: 200, height: 123.5)
        let expected = [firstFrame, secondFrame, thirdFrame, fourthFrame]
        
        //then
        let result = frame.sliceEqually(count: count, from: edge, with: insets)
        XCTAssertEqual(result, expected)
    }

    func testDividedIntegral() {
        //given
        let frame = CGRect(x: 0, y: 0, width: 350, height: 200)
        let fraction: CGFloat = 1 / 5
        let edge = CGRectEdge.minXEdge
        let insets = InterItem(vertical: 2, horizontal: 3)
        
        //when
        let slice = CGRect(x: 0, y: 0, width: 69.4, height: 200)
        let remainder = CGRect(x: 69.4 + 3, y: 0, width: 277.6, height: 200)
        let expected = (first: slice, second: remainder)
        
        //then
        let result = frame.dividedIntegral(fraction: fraction, from: edge, with: insets)
        let eql = result == expected
        XCTAssertTrue(eql)
    }
}

