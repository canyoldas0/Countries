//
//  File name: HomeTableViewCellData.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation
import BaseModules

class CountryListTableViewCellData: GenericDataProtocol {
    
    private(set) var countryName: String
    private(set) var saveButtonData: SaveButtonViewData
    
    init(countryName: String,
         saveButtonData: SaveButtonViewData) {
        self.countryName = countryName
        self.saveButtonData = saveButtonData
    }
    
}
