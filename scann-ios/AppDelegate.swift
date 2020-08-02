//
//  AppDelegate.swift
//  scann-ios
//
//  Created by George Zhuang on 7/22/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import BlinkReceipt
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        BRScanManager.shared().licenseKey = "sRwAAAEPc2Nhbm4uc2Nhbm4taW9z4Hj6OO+XgjaiaH16P2/LQXbekr5DXWA++Juxl/3NArBzkVLXSRSy5NNO9M9NkDhZ3RcFc2YPjL6rn0M4Jhp0mcuorOTbefEQ8IhE7NTrLDC13DbGGohzpVJGoT9vVOvmqaQYG5RoRUTwVbXX6B5L1U05I7e0PYBllFi8zC2E5AEbtmbsvJA="
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: MainTabBarController())
        return true
    }

}

