//
//  HomePreviewCollectionViewCellModel.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/4/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import Foundation

struct HomePreviewCollectionViewCellModel {
    
    let imageUrl: String
    
    func setup(on cell: HomePreviewCollectionViewCell) {
        if let url = URL(string: imageUrl) {
            cell.imageView.loadImage(from: url)
        }
    }
    
    init(with channel: Channel) {
        imageUrl = channel.thumbnailUrl
    }
}
