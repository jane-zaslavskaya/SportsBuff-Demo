//
//  HomeViewModelTestCase.swift
//  SportsBuff-DemoTests
//
//  Created by Yevheniya Zaslavskaya on 3/7/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import XCTest

class HomeViewModelTestCase: XCTestCase {
    
    func testNumberOfModels() {
        //given
        let ch1 = Channel(thumbnailUrl: "https://google.com/test1.jpg")
        let ch2 = Channel(thumbnailUrl: "https://google.com/test2.jpg")
        let ch3 = Channel(thumbnailUrl: "https://google.com/test3.jpg")
        let ch4 = Channel(thumbnailUrl: "https://google.com/test4.jpg")
        
        let vms = [ch1, ch2, ch3, ch4].map { HomePreviewCollectionViewCellModel(with: $0) }
        
        //when
        let expected = 4
        
        //then
        let result = vms.count
        XCTAssertEqual(result, expected)
    }
    
    func testModelForIndexPath() {
        //given
        let ch1 = Channel(thumbnailUrl: "https://google.com/test1.jpg")
        let ch2 = Channel(thumbnailUrl: "https://google.com/test2.jpg")
        let ch3 = Channel(thumbnailUrl: "https://google.com/test3.jpg")
        let ch4 = Channel(thumbnailUrl: "https://google.com/test4.jpg")
        
        let vms = [ch1, ch2, ch3, ch4].map { HomePreviewCollectionViewCellModel(with: $0) }
        let indexPath = IndexPath(row: 2 , section: 0)
        
        //when
        let vm = vms[indexPath.row]
        
        //then
        XCTAssertEqual("https://google.com/test3.jpg", vm.imageUrl)
    }
}
