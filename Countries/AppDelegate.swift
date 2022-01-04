//
//  File name: AppDelegate.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        
        let mainTabBar = MainTabBarBuilder.build()
        self.window?.rootViewController = mainTabBar
        self.window?.makeKeyAndVisible()
        return true
    }

}

