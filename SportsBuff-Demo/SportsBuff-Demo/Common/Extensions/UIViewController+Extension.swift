//
//  UIViewController+Extension.swift
//  SportsBuff-Demo
//
//  Created by Yevheniya Zaslavskaya on 3/6/19.
//  Copyright © 2019 yzaslavskaya. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String?) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alertVC.addAction(cancelAction)
        self.present(alertVC, animated: true, completion: nil)
    }
}
