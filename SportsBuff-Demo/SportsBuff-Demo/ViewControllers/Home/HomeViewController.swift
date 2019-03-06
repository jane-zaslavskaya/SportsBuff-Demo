//
//  HomeViewController.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/4/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    struct K {
        static let homePreviewCellIdentifier = String(describing: HomePreviewCollectionViewCell.self)
    }

    @IBOutlet var collectionView: UICollectionView!
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.loadData()
    }
    
    func configure() {
        viewModel.configure(with: self)
        collectionView.register(UINib(nibName: K.homePreviewCellIdentifier, bundle: nil), forCellWithReuseIdentifier:  K.homePreviewCellIdentifier)
        navigationController?.navigationBar.tintColor = .white
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfModels()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = viewModel.model(for: indexPath)
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.homePreviewCellIdentifier, for: indexPath) as? HomePreviewCollectionViewCell {
            model.setup(on: cell)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController: ViewModelDelegate {
    func showHud() {
        
    }
    
    func showAlert(with message: String) {
        
    }
    
    func refreshData() {
        collectionView.reloadData()
    }
}
