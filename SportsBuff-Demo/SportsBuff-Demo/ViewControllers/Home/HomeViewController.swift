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
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = HomePreviewCollectionViewCellModel(imageUrl: "https://homepages.cae.wisc.edu/~ece533/images/airplane.png")
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.homePreviewCellIdentifier, for: indexPath) as? HomePreviewCollectionViewCell {
            model.setup(on: cell)
            return cell
        }
        return UICollectionViewCell()
    }
}
