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
    
    var collectionViewWidth: CGFloat = 0.0
    var insets: InterItem = InterItem()
    
    init(with collectionViewWidth: CGFloat, insets: InterItem = InterItem()) {
        self.collectionViewWidth = collectionViewWidth
        self.insets = insets
    }
    
    private func getBigSegmentHeight() -> CGFloat {
        let height = collectionViewWidth * 2 / 3
        return height
    }
    
    private func getSmallSegmentHeight() -> CGFloat {
        let height = collectionViewWidth / 3
        return height
    }
    
    func getSmallSegmentFrame(lastFrame: CGRect) -> CGRect {
        return CGRect(x: 0, y: lastFrame.maxY + insets.vertical,
                      width: collectionViewWidth,
                      height: getSmallSegmentHeight())
    }
    
    func getBigSegmentFrame(lastFrame: CGRect) -> CGRect {
        return CGRect(x: 0, y: lastFrame.maxY + insets.vertical,
                      width: collectionViewWidth,
                      height: getBigSegmentHeight())
    }
}
  
