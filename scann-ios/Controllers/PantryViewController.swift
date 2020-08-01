//
//  PantryViewController.swift
//  scann-ios
//
//  Created by George Zhuang on 7/23/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import UIKit

class PantryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let reuseIdentifier : String = "pantryCell"
    private let sections : [String] = ["produce", "meat and poultry", "snacks"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white

        setupNavigationBarItems()
        setupCollections()
    }
    
    private func setupCollections() {
        self.clearsSelectionOnViewWillAppear = false
        self.collectionView!.register(CategoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCell
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 175)
    }
    
    private func setupNavigationBarItems() {
        setupLeftNavItems()
        setupRightNavItems()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        let titleImageView = UIImageView(image: UIImage(named: "scannLogo"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
    }
    
    private func setupLeftNavItems() {
        let addButton = UIButton(type: .system)
        addButton.setImage(UIImage(named: "pantryPlusImage")!.withRenderingMode(.alwaysOriginal), for: .normal)
        addButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        let subButton = UIButton(type: .system)
        subButton.setImage(UIImage(named: "pantryMinusImage")!.withRenderingMode(.alwaysOriginal), for: .normal)
        addButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: addButton), UIBarButtonItem(customView: subButton)]
    }
    
    private func setupRightNavItems() {
        let optionButton = UIButton(type: .system)
        optionButton.setImage(UIImage(named: "pantryOptionsImage")!.withRenderingMode(.alwaysOriginal), for: .normal)
        optionButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        let userButton = UIButton(type: .system)
        userButton.setImage(UIImage(named: "pantryUserImage")!.withRenderingMode(.alwaysOriginal), for: .normal)
        userButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: userButton), UIBarButtonItem(customView: optionButton)]
    }
    
}