//
//  File name: DetailViewBuilder.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit

class DetailViewBuilder {
    
    class func build(with request: CountryDetailRequest) -> UIViewController {
        let persistencyManager = PersistencyDataManager()
        let dataFormatter = DetailViewDataFormatter(persistencyManager: persistencyManager)
        let viewModel = DetailViewModel(dataFormatter: dataFormatter,
                                        request: request)
        let viewController = DetailViewController(viewModel: viewModel)
        return viewController
    }
}
