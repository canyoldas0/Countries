//
//  File name: MainTabBarBuilder.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit

class MainTabBarBuilder {
    
    class func build() -> UIViewController {
        
        let homeVC = HomeViewBuilder.build()
        let savedVC = SavedViewBuilder.build()

        let tabViewController = MainTabBarController()
        tabViewController.viewControllers = [homeVC, savedVC]
        tabViewController.tabBar.tintColor = .black
        tabViewController.tabBar.backgroundColor = AppTheme.primary.value
        tabViewController.tabBar.tintColor = AppTheme.white.value
        tabViewController.tabBar.unselectedItemTintColor = AppTheme.white.value
        
        return tabViewController
        
    }
    
}
