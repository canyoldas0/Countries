//
//  File name: SavedViewBuilder.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit

class SavedViewBuilder {
    
    class func build() -> UIViewController  {
        
        let viewModel = SavedViewModel()
        let viewController = SavedViewController(viewModel: viewModel)
        viewController.title = "Saved"
        viewController.tabBarItem.image = TabBarImages.favorite.value
        viewController.tabBarItem.selectedImage = TabBarImages.favoriteSelected.value
        return viewController
    }
}
