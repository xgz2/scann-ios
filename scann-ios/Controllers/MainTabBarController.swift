//
//  MainTabBarController.swift
//  scann-ios
//
//  Created by George Zhuang on 7/27/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import BlinkReceipt
import UIKit

class MainTabBarController: UITabBarController, BRScanResultsDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 30)
                
        let pantryNav = generateNavController(vc: PantryViewController(collectionViewLayout: layout), title: "Pantry", image: UIImage(named: "pantryImage")!)
        let cameraNav = generateNavController(vc: CameraViewController(), title: "Scan", image: UIImage(named: "cameraImage")!)
        let searchNav = generateNavController(vc: SearchViewController(collectionViewLayout: layout), title: "Search", image: UIImage(named: "searchImage")!)
        let dashNav = generateNavController(vc: DashViewController(), title: "Dash", image: UIImage(named:"dashImage")!)

        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        viewControllers = [pantryNav, cameraNav, searchNav, dashNav]
    }
    
    fileprivate func generateNavController(vc: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.image = image

        return navController
    }

}
