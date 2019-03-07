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
        static let detailsControllerIdentifier = String(describing: DetailsViewController.self)
    }

    @IBOutlet var collectionView: UICollectionView!
    var viewModel = HomeViewModel()
    @IBOutlet weak var hudView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.loadData()
    }
    
    func configure() {
        setupNavigation()
        viewModel.configure(with: self)
        collectionView.register(UINib(nibName: K.homePreviewCellIdentifier, bundle: nil), forCellWithReuseIdentifier:  K.homePreviewCellIdentifier)
        navigationController?.navigationBar.tintColor = .white
    }
    
    
    func setupNavigation() {
        let profileItem = UIBarButtonItem(with: UIImage(named: "person"))
        let searchBar = UISearchBar()
        searchBar.barStyle = .black
        searchBar.placeholder = "Search for content"
        let achievementsItem = UIBarButtonItem(with: UIImage(named: "trophy"))
        let historyItem = UIBarButtonItem(with: UIImage(named: "time"))
        let statisticsItem = UIBarButtonItem(with: UIImage(named: "podium"))
        navigationItem.leftBarButtonItems = [profileItem]
        navigationItem.rightBarButtonItems = [achievementsItem, statisticsItem, historyItem]
        navigationItem.titleView = searchBar

    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfModels()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = viewModel.model(for: indexPath)
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.homePreviewCellIdentifier,
                                                         for: indexPath) as? HomePreviewCollectionViewCell {
            model.setup(on: cell)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = mainSB.instantiateViewController(withIdentifier: K.detailsControllerIdentifier)
            as? DetailsViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: ViewModelDelegate {
    func showHud() {
        hudView.startAnimating()
        hudView.isHidden = false
    }
    
    func hideHud() {
        hudView.stopAnimating()
        hudView.isHidden = true
        UIView.animate(withDuration: 0.5) {
            self.collectionView.alpha = 1
        }
    }
    
    func showAlert(with message: String) {
        showAlert(title: nil, message: message)
    }
    
    func refreshData() {
        collectionView.reloadData()
    }
}
