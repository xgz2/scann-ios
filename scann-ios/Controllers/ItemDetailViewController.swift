//
//  ItemDetailViewController.swift
//  scann-ios
//
//  Created by George Zhuang on 8/2/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import SnapKit
import UIKit

// Placeholder detail view

class ItemDetailViewController: UIViewController {
    
    private let placeImageView = UIImageView(image: UIImage(named: "itemDetailPlace"))
    
//    private let addButton = UIButton()
//    private let favoriteButton = UIButton()
//    private let itemLabel = UILabel()
//    private let minusButton = UIButton()
//
//    var item: Item!
//
//    init(item: Item) {
//        super.init(nibName: nil, bundle: nil)
//
//        self.item = item
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view = placeImageView
        
//        view.addSubview(placeImageView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
//        placeImageView.snp.makeConstraints { make in
//            make.top.bottom.leading.trailing.equalToSuperview()
//        }
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
