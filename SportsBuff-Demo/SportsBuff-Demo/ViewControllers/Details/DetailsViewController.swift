//
//  DetailsViewController.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/6/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    struct K {
        static let followerCellIdentifier = String(describing: FollowerTableViewCell.self)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        tableView.register(UINib(nibName: K.followerCellIdentifier, bundle: nil),
                           forCellReuseIdentifier: K.followerCellIdentifier)
    }
}

extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: K.followerCellIdentifier, for: indexPath) as? FollowerTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
    
    
}
