//
//  PantryViewController.swift
//  scann-ios
//
//  Created by George Zhuang on 7/23/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import UIKit

class PantryViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        
        setupNavigationBarItems()
    }
    
    private func setupNavigationBarItems() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        let titleImageView = UIImageView(image: UIImage(named: "scannLogo"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
}
