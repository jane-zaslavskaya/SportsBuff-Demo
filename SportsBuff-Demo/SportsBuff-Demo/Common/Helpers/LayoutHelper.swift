//
//  LayoutHelper.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/4/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import Foundation
import UIKit

class LayoutHelper {
    
    struct K {
        static let itemInset: CGFloat = 1.0
    }
    
    static private func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static private func getBigSegmentHeight() -> CGFloat {
        let height = getScreenWidth() / 3 * 2
        return height
    }
    
    static private func getSmallSegmentHeight() -> CGFloat {
        let height = getScreenWidth() / 3
        return height
    }
    
    static func getSmallSegmentFrame(lastFrame: CGRect) -> CGRect {
        return CGRect(x: 0, y: lastFrame.maxY + K.itemInset, width: getScreenWidth(), height: getSmallSegmentHeight())
    }
    
    static func getBigSegmentFrame(lastFrame: CGRect) -> CGRect {
        return CGRect(x: 0, y: lastFrame.maxY + K.itemInset, width: getScreenWidth(), height: getBigSegmentHeight())
    }
}
