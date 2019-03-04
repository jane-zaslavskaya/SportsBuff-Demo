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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        collectionView.register(UINib(nibName: K.homePreviewCellIdentifier, bundle: nil), forCellWithReuseIdentifier:  K.homePreviewCellIdentifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.homePreviewCellIdentifier, for: indexPath)
         return cell
    }
}
