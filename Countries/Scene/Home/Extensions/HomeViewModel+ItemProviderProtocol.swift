//
//  File name: HomeViewModel+ItemProviderProtocol.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 31.12.2021
//  
//

import Foundation
import BaseModules

extension HomeViewModel: ItemProviderProtocol {
    
    
    func askNumberOfSection() -> Int {
        return dataFormatter.getNumberOfSection()
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return dataFormatter.getNumberOfItem(in: section)
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return dataFormatter.getItem(at: index)
    }
    
    func selectedItem(at index: Int) {
//        detailViewState?(DetailDataRequest(id: dataFormatter.getItemId(at: index)))
    }
}
