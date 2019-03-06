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
    var viewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.loadData()
    }
    
    func configure() {
        viewModel.configure(with: self)
        tableView.register(UINib(nibName: K.followerCellIdentifier, bundle: nil),
                           forCellReuseIdentifier: K.followerCellIdentifier)
    }
}

extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfModels()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.model(for: indexPath)
        if let cell = tableView.dequeueReusableCell(withIdentifier: K.followerCellIdentifier, for: indexPath) as? FollowerTableViewCell {
            model.setup(on: cell)
            return cell
        }
        return UITableViewCell()
    }
}

extension DetailsViewController: ViewModelDelegate {
    
    func showHud() {
        
    }
    
    func showAlert(with message: String) {
        
    }
    
    func refreshData() {
        tableView.reloadData()
    }
}
