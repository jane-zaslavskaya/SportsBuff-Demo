//
//  UIImage+SportsBuff.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/7/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit

extension UIImage {
    enum AssetIdentifier: String {
        case person = "person"
        case time = "time"
        case trophy = "trophy"
        case podium = "podium"
    }
    
    convenience init?(_ identifier: AssetIdentifier) {
        self.init(named: identifier.rawValue)
    }
}
