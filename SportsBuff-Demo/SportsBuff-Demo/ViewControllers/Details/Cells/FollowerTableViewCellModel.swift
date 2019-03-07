//
//  FollowerTableViewCellModel.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/6/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import Foundation

struct FollowerTableViewCellModel {
    
    let imageUrl: String
    let name: String
    let region: String
    let age: String
    
    func setup(on cell: FollowerTableViewCell) {
        if let url = URL(string: imageUrl) {
            cell.avatarImageView.loadImage(from: url)
        }
        cell.nameLabel.text = name
        cell.regionLabel.text = region
        cell.ageLabel.text = age
    }
    
    init(with follower: Follower) {
        imageUrl = follower.photo
        name = follower.name
        region = follower.region
        age = "\(follower.age) yrs"
    }
}
