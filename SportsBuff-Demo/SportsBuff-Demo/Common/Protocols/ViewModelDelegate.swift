//
//  ViewModelDelegate.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/6/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func refreshData()
    func showHud()
    func showAlert(with message: String)
}
