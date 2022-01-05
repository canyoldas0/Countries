//
//  File name: SavedViewModel+ItemProviderProtocol.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 5.01.2022
//  
//

import Foundation
import BaseModules

extension SavedViewModel: ItemProviderProtocol {
    
    func askNumberOfSection() -> Int {
        return 1
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return 1
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return nil
    }
    
}
