//
//  HomePreviewLayoutDisplay.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/8/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit

protocol HomePreviewLayoutDisplayProtocol {
    func prepare(with count: Int, insets: InterItem)
    func configure(with helper: LayoutHelperProtocol)
    func firstMatchIndex(rect: CGRect) -> Int?
}

class HomePreviewLayoutDisplay: HomePreviewLayoutDisplayProtocol {
    
    var contentBounds = CGRect.zero
    var cachedAttributes = [UICollectionViewLayoutAttributes]()
    var layoutHelper: LayoutHelperProtocol?
    var lastFrame: CGRect = .zero
    var currentIndex = 0
    
    func configure(with helper: LayoutHelperProtocol) {
        self.layoutHelper = helper
    }
    
    func prepare(with count: Int, insets: InterItem = InterItem()) {
        
        var segment: MosaicSegmentStyle = .threeEqual
        lastFrame = .zero
        currentIndex = 0
        
        while currentIndex < count {
          
            let rects = segmentRects(with: lastFrame, segmentStyle: segment, insets: insets)
            createAndCache(in: rects)
            // Determine the next segment style.
            switch count - currentIndex {
            case 1:
                segment = .threeEqual
            default:
                segment = .twoThirdsOneThird
            }
        }
    }
    
    func createAndCache(in rects: [CGRect]) {
        for rect in rects {
            let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: currentIndex,
                                                                                     section: 0))
            attributes.frame = rect
            
            cachedAttributes.append(attributes)
            contentBounds = contentBounds.union(lastFrame)
            
            currentIndex += 1
            lastFrame = rect
        }
        
    }
    
    func segmentRects(with lastFrame: CGRect,
                      segmentStyle: MosaicSegmentStyle,
                      insets: InterItem = InterItem()) -> [CGRect] {
        var segmentRects = [CGRect]()
        guard let layoutHelper = layoutHelper else {
            return segmentRects
        }
        switch segmentStyle {
        case .threeEqual:
            let segmentFrame = layoutHelper.getSmallSegmentFrame(lastFrame: lastFrame)
            segmentRects = segmentFrame.sliceEqually(count: 3, from: .minXEdge,
                                                     with: insets)
        case .twoThirdsOneThird:
            let segmentFrame = layoutHelper.getBigSegmentFrame(lastFrame: lastFrame)
            let horizontalSlices = segmentFrame.dividedIntegral(fraction: (2.0 / 3.0), from: .minXEdge,
                                                                with: insets)
            let verticalSlices = horizontalSlices.second.dividedIntegral(fraction: 0.5, from: .minYEdge,
                                                                         with: insets)
            segmentRects = [horizontalSlices.first, verticalSlices.first, verticalSlices.second]
        }
        return segmentRects
    }
    
    
    // Perform a binary search on the cached attributes array.
    private func binSearch(_ rect: CGRect, start: Int, end: Int) -> Int? {
        if end < start { return nil }
        
        let mid = (start + end) / 2
        let attr = cachedAttributes[mid]
        
        if attr.frame.intersects(rect) {
            return mid
        } else {
            if attr.frame.maxY < rect.minY {
                return binSearch(rect, start: (mid + 1), end: end)
            } else {
                return binSearch(rect, start: start, end: (mid - 1))
            }
        }
    }
    
    func firstMatchIndex(rect: CGRect) -> Int? {
        guard let lastIndex = cachedAttributes.indices.last else {
            return nil
        }
        return binSearch(rect, start: 0, end: lastIndex)
    }
}
