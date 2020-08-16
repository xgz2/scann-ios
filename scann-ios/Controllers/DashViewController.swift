//
//  DashViewController.swift
//  scann-ios
//
//  Created by George Zhuang on 7/23/20.
//  Copyright © 2020 Scann. All rights reserved.
//

// This is currently a placeholder view where metrics will eventually be displayed

import UIKit

class DashViewController: UIViewController {
    
    private let holderView = UIImageView(image: UIImage(named: "trackPlaceholder"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        holderView.contentMode = .scaleAspectFit
        view.addSubview(holderView)
        
        setupNavigationItems()
        setupConstraints()
    }
    
    func setupConstraints() {
        holderView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(-20)
            make.trailing.equalToSuperview().offset(20)
        }
    }
    
    func setupNavigationItems() {
           navigationController?.navigationBar.barTintColor = .white
           navigationController?.navigationBar.isTranslucent = false
           navigationController?.navigationBar.shadowImage = UIImage()
           
           let titleImageView = UIImageView(image: UIImage(named: "scannDashLogo"))
           titleImageView.frame = CGRect(x: 0, y: 0, width: 240, height: 34)
           titleImageView.contentMode = .scaleAspectFit
           
           navigationItem.titleView = titleImageView
       }

}
