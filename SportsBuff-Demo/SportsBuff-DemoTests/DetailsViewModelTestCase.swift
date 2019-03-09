//
//  DetailsViewModelTestCase.swift
//  SportsBuff-DemoTests
//
//  Created by Yevheniya Zaslavskaya on 3/7/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import XCTest

class DetailsViewModelTestCase: XCTestCase {
    
    func testNumberOfModels() {
        //given
        let f1 = Follower(name: "name1", region: "region1", age: 21, photo: "https://google.com/test1.jpg")
        let f2 = Follower(name: "name2", region: "region2", age: 32, photo: "https://google.com/test2.jpg")
        let f3 = Follower(name: "name3", region: "region3", age: 34, photo: "https://google.com/test3.jpg")
        
        let vms = [f1,f2,f3].map { FollowerTableViewCellModel(with: $0) }
        
        //when
        let expected = 3
        
        //then
        let result = vms.count
        XCTAssertEqual(result, expected)
    }

    func testModelForIndexPath() {
        //given
        let f1 = Follower(name: "name1", region: "region1", age: 21, photo: "https://google.com/test1.jpg")
        let f2 = Follower(name: "name2", region: "region2", age: 32, photo: "https://google.com/test2.jpg")
        let f3 = Follower(name: "name3", region: "region3", age: 34, photo: "https://google.com/test3.jpg")
        
        let vms = [f1,f2,f3].map { FollowerTableViewCellModel(with: $0) }
        let indexPath = IndexPath(row: 1 , section: 0)
        
        //when
        let vm = vms[indexPath.row]
        
        //then
        XCTAssertEqual("name2", vm.name)
        XCTAssertEqual("region2", vm.region)
        XCTAssertEqual("32 yrs", vm.age)
        XCTAssertEqual("https://google.com/test2.jpg", vm.imageUrl)
    }
}
