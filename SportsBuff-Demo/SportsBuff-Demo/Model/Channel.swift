//
//  Channel.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/5/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import Foundation

struct Channel: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
