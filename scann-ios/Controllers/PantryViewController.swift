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
    
    var itemCategories: [ItemCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
//        ItemCategory.fetchPantryItems { (itemCategories) -> () in
//            self.itemCategories = itemCategories
//            self.collectionView.reloadData()
//        }
        
        itemCategories = PantryItemService.fetchDummyItems()
        self.collectionView.reloadData()

        setupNavigationBarItems()
        setupCollections()
        
        let alert = UIAlertController(title: "Items Expiring Soon", message: "Make sure to use your eggs before they expire tomorrow!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showItemDetail(forItem item: Item) {
        let itemDetailViewController = ItemDetailViewController()
        present(itemDetailViewController, animated: true)
    }
    
    private func setupCollections() {
        self.clearsSelectionOnViewWillAppear = true
        self.collectionView!.register(CategoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = itemCategories?.count {
            return count
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCell
        cell.itemCategory = itemCategories?[indexPath.item]
        cell.pantryViewController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 175)
    }
    
    // Give us more veg
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: addButton)
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
