//
//  DetailsViewModel.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/6/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    var elements = [FollowerTableViewCellModel]()
    var followers: [Follower]? {
        didSet {
            if let followers = followers {
                elements = followers.map { FollowerTableViewCellModel(with: $0) }
            }
        }
    }
    
    private weak var delegate: ViewModelDelegate?
    
    func configure(with delegate: ViewModelDelegate) {
        self.delegate = delegate
    }
    
    func numberOfModels() -> Int {
        return elements.count
    }
    
    func model(for indexPath: IndexPath) -> FollowerTableViewCellModel {
        return elements[indexPath.row]
    }
    
    func loadData() {
        delegate?.showHud()
        APIClient.getFollowers { result in
            switch result {
            case .success(let response):
                self.followers = response
                self.delegate?.refreshData()
                self.delegate?.hideHud()
                print(response)
            case .failure(let error):
                self.delegate?.showAlert(with: error.localizedDescription)
                self.delegate?.hideHud()
                print(error)
            }
        }
    }
}
