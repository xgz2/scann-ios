//
//  SearchViewController.swift
//  scann-ios
//
//  Created by George Zhuang on 7/23/20.
//  Copyright © 2020 Scann. All rights reserved.
//

// This is also somewhat of a placeholder until real search is implemented

import UIKit

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let reuseIdentifier = "SearchSectionId"
    private let searchController = UISearchController(searchResultsController: nil)
    
    var searchCategories: [SearchCategory]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        searchCategories = SearchService.fetchDummyItems()
//        searchCategories = []

        
        setupNavigationItems()
        setupCollections()
        setupSearch()

    }
    
    private func setupCollections() {
        self.clearsSelectionOnViewWillAppear = false
        self.collectionView!.register(SearchSectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = searchCategories?.count {
            return count
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchSectionCell
        cell.searchCategory = searchCategories?[indexPath.item]
        cell.searchViewController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 175)
    }
    
    // Give us more category?
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        print(searchController.view.frame.height)
        return CGSize(width: 0, height: 0)
    }
    
    
    func setupSearch() {
        // Can't figure out why there is gray behind the search bar (probably just b/c i haven't actually configured it)
        searchController.view.backgroundColor = .white
        searchController.view.tintColor = .white
        searchController.searchBar.backgroundColor = .white
        searchController.searchBar.sizeToFit()
        navigationItem.hidesSearchBarWhenScrolling = false
        //        searchController.searchBar.backgroundImage = UIImage()
//        searchController.searchBar.tintColor = .white
//        searchController.searchBar.barTintColor = .white
        
//        searchController.searchBar.becomeFirstResponder()

//        self.navigationItem.titleView = searchController.searchBar
        
        navigationItem.searchController = searchController
    }
    
    func setupNavigationItems() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.view.backgroundColor = .white
        // This was also an attempt as above
//        navigationController?.navigationBar.backgroundColor = .white
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let titleImageView = UIImageView(image: UIImage(named: "scannSearchLogo"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 240, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
    func showRecipeDetail(forRecipe recipe: Recipe) {
        let vc = ItemDetailViewController()
        vc.placeImageView = UIImageView(image: UIImage(named: "shakPlace"))
        present(vc, animated: true, completion: nil)
    }
    


}
