//
//  File name: HomeViewBuilder.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit

class HomeViewBuilder {
    
    class func build() -> UIViewController {

        let dataFormatter = HomeViewDataFormatter()
        let viewModel = HomeViewModel(dataFormatter: dataFormatter)
        let viewController = HomeViewController(viewModel: viewModel)
        viewController.title = "Home"
        viewController.tabBarItem.image = TabBarImages.home.value
        viewController.tabBarItem.selectedImage = TabBarImages.homeSelected.value
        
        let navigationVC = UINavigationController(rootViewController: viewController)
        return navigationVC
    }
}
