//
//  FollowerTableViewCell.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/5/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit

class FollowerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ageView: UIView! {
        didSet {
            ageView.layer.borderColor = UIColor.white.cgColor
        }
    }
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
}
