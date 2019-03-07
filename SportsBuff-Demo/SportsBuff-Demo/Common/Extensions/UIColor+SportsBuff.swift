//
//  UIColor+SportsBuff.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/7/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit

extension UIColor {
    enum ColorType {
        case navigationGray
    }
    
    convenience init(_ colorType: ColorType) {
        switch colorType {
        case .navigationGray:
            self.init(hexString: "121212")
        }
    }
}
