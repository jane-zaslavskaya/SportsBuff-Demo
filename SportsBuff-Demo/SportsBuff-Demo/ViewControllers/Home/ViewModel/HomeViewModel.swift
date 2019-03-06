//
//  HomeViewModel.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/6/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var elements = [HomePreviewCollectionViewCellModel]()
    var channels: [Channel]? {
        didSet {
            if let channels = channels {
                elements = channels.map { HomePreviewCollectionViewCellModel(with: $0) }
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
    
    func model(for indexPath: IndexPath) -> HomePreviewCollectionViewCellModel {
        return elements[indexPath.row]
    }
    
    func loadData() {
        delegate?.showHud()
        APIClient.getChannels { result in
            switch result {
            case .success(let response):
                self.channels = response
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
