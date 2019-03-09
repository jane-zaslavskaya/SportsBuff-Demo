//
//  ImageLoader.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/5/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit

protocol ImageLoader {
        
    func load(into imageView: UIImageView,
              from url: URL,
              placeholder: UIImage?,
              progressBlock: ImageLoader.ProgressBlock?,
              completionHandler: ImageLoader.CompletionBlock?)
    
    func cancel(_ imageView: UIImageView)
    
    func clearCache()
}

extension ImageLoader {
    typealias ProgressBlock = (_ receivedSize: Int, _ totalSize: Int) -> Void
    typealias CompletionBlock = (_ image: UIImage?, _ error: Error?) -> Void
}
