//
//  KingfisherImageLoader.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/5/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit
import Kingfisher

final class KingfisherImageLoader: ImageLoader {
    
    static var standard: KingfisherImageLoader {
        return KingfisherImageLoader()
    }
    
    func load(into imageView: UIImageView,
              from url: URL,
              placeholder: UIImage?,
              progressBlock: ImageLoader.ProgressBlock?,
              completionHandler: ImageLoader.CompletionBlock?) {
        
        imageView.kf.cancelDownloadTask()
        imageView.kf.setImage(with: url, placeholder: placeholder, options: [],
                              progressBlock: { (receivedSize, totalSize) in
                                if let progressBlock = progressBlock {
                                    progressBlock(Int(truncatingIfNeeded: receivedSize), Int(truncatingIfNeeded: totalSize))
                                }
        }, completionHandler: { (image, error, _, _) in
            if let completionHandler = completionHandler {
                if let image = image, error == nil {
                    completionHandler(image, nil)
                } else {
                    completionHandler(nil, error)
                }
            }
        })
    }
    
    func cancel(_ imageView: UIImageView) {
        imageView.kf.cancelDownloadTask()
    }
    
    func clearCache() {
        KingfisherManager.shared.cache.clearMemoryCache()
        KingfisherManager.shared.cache.clearDiskCache()
    }
}
