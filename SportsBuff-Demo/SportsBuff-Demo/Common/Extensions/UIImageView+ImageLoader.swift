//
//  UIImageView+ImageLoader.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/5/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL,
                   loader: ImageLoader = KingfisherImageLoader.standard,
                   placeholder: UIImage? = nil,
                   progressBlock: ImageLoader.ProgressBlock? = nil,
                   completionHandler: ImageLoader.CompletionBlock? = nil
        ) {
        
        loader.load(into: self, from: url,
                    placeholder: placeholder, progressBlock: progressBlock, completionHandler: completionHandler)
    }
    
    func cancelLoadImage(_ loader: ImageLoader = KingfisherImageLoader.standard) {
        loader.cancel(self)
    }
}
