//
//  MainTabBarController.swift
//  scann-ios
//
//  Created by George Zhuang on 7/27/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let pantryNav = generateNavController(vc: PantryViewController(), title: "Pantry", image: UIImage(named: "pantryImage")!)
        let cameraNav = generateNavController(vc: CameraViewController(), title: "Scan", image: UIImage(named: "cameraImage")!)
        let searchNav = generateNavController(vc: SearchViewController(), title: "Search", image: UIImage(named: "searchImage")!)
        let dashNav = generateNavController(vc: DashViewController(), title: "Dash", image: UIImage(named:"dashImage")!)

        UITabBar.appearance().backgroundColor = .clear
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
