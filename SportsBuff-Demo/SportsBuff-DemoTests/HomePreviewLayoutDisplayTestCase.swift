//
//  HomePreviewLayoutDisplayTestCase.swift
//  SportsBuff-DemoTests
//
//  Created by Yevheniya Zaslavskaya on 3/8/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import XCTest

class HomePreviewLayoutDisplayTestCase: XCTestCase {

    class LayoutHelperFake: LayoutHelperProtocol {
        
        var smallRect: CGRect?
        var bigRect: CGRect?

        func getSmallSegmentFrame(lastFrame: CGRect) -> CGRect {
            return smallRect ?? .zero
        }
        
        func getBigSegmentFrame(lastFrame: CGRect) -> CGRect {
            return bigRect ?? .zero
        }
    }
    
    func testBigSegmentRects() {
        //given
        let layoutDisplay = HomePreviewLayoutDisplay()
        let helper = LayoutHelperFake()
        helper.bigRect = CGRect(x: 0, y: 128, width: 375, height: 250)
        layoutDisplay.configure(with: helper)
        
        let lastFrame = CGRect(x: 251, y: 1.5, width: 124, height: 125)
        let insets = InterItem(vertical: 1.5, horizontal: 1.5)

        //when
        let frame1 = CGRect(x: 0, y: 128, width: 249, height: 250)
        let frame2 = CGRect(x: 250.5, y: 128, width: 124.5, height: 124.25)
        let frame3 = CGRect(x: 250.5, y: 253.75, width: 124.5, height: 124.25)
        let expected = [frame1, frame2, frame3]
        
        //then
        let result = layoutDisplay.segmentRects(with: lastFrame, segmentStyle: .twoThirdsOneThird, insets: insets)
        XCTAssertEqual(result, expected)
    }
    
    func testSmallSegmentRects() {
        //given
        let layoutDisplay = HomePreviewLayoutDisplay()
        let helper = LayoutHelperFake()
        helper.smallRect = CGRect(x: 0, y: 1.5, width: 375, height: 125)
        layoutDisplay.configure(with: helper)
        
        let lastFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
        let insets = InterItem(vertical: 1.5, horizontal: 1.5)
        
        //when
        let frame1 = CGRect(x: 0, y: 1.5, width: 124, height: 125)
        let frame2 = CGRect(x: 125.5, y: 1.5, width: 124, height: 125)
        let frame3 = CGRect(x: 251, y: 1.5, width: 124, height: 125)
        let expected = [frame1, frame2, frame3]
        
        //then
        let result = layoutDisplay.segmentRects(with: lastFrame, segmentStyle: .threeEqual, insets: insets)
        XCTAssertEqual(result, expected)
    }
    
    func testPrepare() {
        //given
        let layoutDisplay = HomePreviewLayoutDisplay()
        let helper = LayoutHelperFake()
        layoutDisplay.configure(with: helper)
        
        //when
        layoutDisplay.prepare(with: 50, insets: InterItem(vertical: 2, horizontal: 1))
        let expected = 50 + 1
        
        //then
        XCTAssertEqual(layoutDisplay.currentIndex, expected)
    }
}
