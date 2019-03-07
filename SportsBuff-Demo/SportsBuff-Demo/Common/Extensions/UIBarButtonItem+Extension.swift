//
//  UIBarButtonItem+Extension.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/6/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    struct K {
        static let buttonWidth: CGFloat = 30
        static let buttonHeight: CGFloat = 25
    }
    
    convenience init(with image: UIImage?) {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        let width = button.widthAnchor.constraint(equalToConstant: K.buttonWidth)
        width.isActive = true
        let height = button.heightAnchor.constraint(equalToConstant: K.buttonHeight)
        height.isActive = true
        self.init(customView: button)
    }
}
