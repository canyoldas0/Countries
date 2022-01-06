//
//  File name: DetailViewComponentData.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation
import BaseModules

class DetailViewComponentData: GenericDataProtocol {
    
    private(set) var imageData: String
    private(set) var countryCode: String
    private(set) var id: String
    private(set) var countryTitle: String
    private(set) var saveButtonData: SaveButtonViewData
    
    init(imageData: String,
         countryCode: String,
         id: String,
         countryTitle: String,
         saveButtonData: SaveButtonViewData) {
        self.imageData = imageData
        self.countryCode = countryCode
        self.id = id
        self.countryTitle = countryTitle
        self.saveButtonData = saveButtonData
    }
    
}

