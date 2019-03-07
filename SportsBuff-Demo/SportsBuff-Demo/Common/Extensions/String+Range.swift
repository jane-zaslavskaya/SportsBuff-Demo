//
//  String+Range.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/7/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import Foundation

extension String {
    func substring(from index: Int) -> String {
        return String(self[self.index(startIndex, offsetBy: index)...])
    }
    
    func substring(with range: Range<Int>) -> String {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = index(self.startIndex, offsetBy: range.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
