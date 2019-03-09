//
//  HomePreviewLayout.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/5/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit

enum MosaicSegmentStyle {
    case threeEqual
    case twoThirdsOneThird
}

class HomePreviewLayout: UICollectionViewLayout {
    
    let layoutDisplay = HomePreviewLayoutDisplay()
    
    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }
        // Reset cached information.
        
        let count = collectionView.numberOfItems(inSection: 0)
        let insets = InterItem(vertical: 1, horizontal: 1)
        let collectionViewWidth = collectionView.bounds.size.width
        
        let layoutHelper = LayoutHelper(with: collectionViewWidth, insets: insets)
        layoutDisplay.configure(with: layoutHelper)
        layoutDisplay.cachedAttributes.removeAll()
        layoutDisplay.contentBounds = CGRect(origin: .zero, size: collectionView.bounds.size)
        layoutDisplay.prepare(with: count, insets: insets)
    }
    
    override var collectionViewContentSize: CGSize {
        return layoutDisplay.contentBounds.size
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else { return false }
        return !newBounds.size.equalTo(collectionView.bounds.size)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return layoutDisplay.cachedAttributes[indexPath.item]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        
        // Find any cell that sits within the query rect.
        guard let firstMatchIndex = layoutDisplay.firstMatchIndex(rect: rect) else {
            return attributesArray
        }
        
        // Starting from the match, loop up and down through the array until all the attributes
        // have been added within the query rect.
        for attributes in layoutDisplay.cachedAttributes[..<firstMatchIndex].reversed() {
            guard attributes.frame.maxY >= rect.minY else { break }
            attributesArray.append(attributes)
        }
        
        for attributes in layoutDisplay.cachedAttributes[firstMatchIndex...] {
            guard attributes.frame.minY <= rect.maxY else { break }
            attributesArray.append(attributes)
        }
        
        return attributesArray
    }
    
  

}
