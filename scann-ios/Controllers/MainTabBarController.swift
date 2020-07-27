//
//  MainTabBarController.swift
//  scann-ios
//
//  Created by George Zhuang on 7/27/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pantryNav = generateNavController(vc: PantryViewController(), title: "Pantry", image: UIImage(named: "pantryImage")!)
        let cameraNav = generateNavController(vc: CameraViewController(), title: "Scan", image: UIImage(named: "cameraImage")!)
        let searchNav = generateNavController(vc: SearchViewController(), title: "Search", image: UIImage(named: "searchImage")!)
        let dashNav = generateNavController(vc: DashViewController(), title: "Dash", image: UIImage(named:"dashImage")!)
        
        UINavigationBar.appearance().prefersLargeTitles = true
        viewControllers = [pantryNav, cameraNav, searchNav, dashNav]
    }
    
    fileprivate func generateNavController(vc: UIViewController, title: String, image: UIImage) -> UINavigationController {
        vc.navigationItem.title = title
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        navController.tabBarItem.image = image
        return navController
    }

}
