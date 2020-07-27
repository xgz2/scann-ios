//
//  AppDelegate.swift
//  scann-ios
//
//  Created by George Zhuang on 7/22/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: MainTabBarController())
        window?.makeKeyAndVisible()
        return true
    }

}

