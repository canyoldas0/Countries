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
    
     init(countryName: String) {
        self.countryName = countryName
    }
    
}
