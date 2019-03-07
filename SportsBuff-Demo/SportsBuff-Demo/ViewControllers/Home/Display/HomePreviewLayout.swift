//
//  HomePreviewLayout.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/5/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit

enum MosaicSegmentStyle {
    case fullWidth
    case threeEqual
    case twoThirdsOneThird
}

class HomePreviewLayout: UICollectionViewLayout {

    var contentBounds = CGRect.zero
    var cachedAttributes = [UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        // Reset cached information.
        cachedAttributes.removeAll()
        contentBounds = CGRect(origin: .zero, size: collectionView.bounds.size)
        
        let count = collectionView.numberOfItems(inSection: 0)
        
        var currentIndex = 0
        var segment: MosaicSegmentStyle = .threeEqual
        var lastFrame: CGRect = .zero
        let insets = InterItem(vertical: 1, horizontal: 1)
        let collectionViewWidth = collectionView.bounds.size.width
        
        let layoutHelper = LayoutHelper(with: collectionViewWidth, insets: insets)
        
        while currentIndex < count {
            
            var segmentRects = [CGRect]()
            switch segment {
            case .fullWidth:
                let segmentFrame = layoutHelper.getSmallSegmentFrame(lastFrame: lastFrame)
                segmentRects = [segmentFrame]
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
            
            // Create and cache layout attributes for calculated frames.
            for rect in segmentRects {
                let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: currentIndex,
                                                                                         section: 0))
                attributes.frame = rect
                
                cachedAttributes.append(attributes)
                contentBounds = contentBounds.union(lastFrame)
                
                currentIndex += 1
                lastFrame = rect
            }
            
            // Determine the next segment style.
            switch count - currentIndex {
            case 1:
                segment = .threeEqual
            default:
                segment = .twoThirdsOneThird
            }
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return contentBounds.size
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else { return false }
        return !newBounds.size.equalTo(collectionView.bounds.size)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cachedAttributes[indexPath.item]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        
        // Find any cell that sits within the query rect.
        guard let lastIndex = cachedAttributes.indices.last,
            let firstMatchIndex = binSearch(rect, start: 0, end: lastIndex) else { return attributesArray }
        
        // Starting from the match, loop up and down through the array until all the attributes
        // have been added within the query rect.
        for attributes in cachedAttributes[..<firstMatchIndex].reversed() {
            guard attributes.frame.maxY >= rect.minY else { break }
            attributesArray.append(attributes)
        }
        
        for attributes in cachedAttributes[firstMatchIndex...] {
            guard attributes.frame.minY <= rect.maxY else { break }
            attributesArray.append(attributes)
        }
        
        return attributesArray
    }
    
    // Perform a binary search on the cached attributes array.
    func binSearch(_ rect: CGRect, start: Int, end: Int) -> Int? {
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

}
