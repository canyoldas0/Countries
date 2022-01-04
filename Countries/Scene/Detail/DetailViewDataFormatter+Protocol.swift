//
//  File name: DetailViewDataFormatter+Protocol.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation
import BaseModules

protocol DetailViewDataFormatterProtocol {
    
    func setData(with response: CountryDetailResponse)
    func getItem() -> GenericDataProtocol?
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getTitle() -> String
    func getItemId() -> String
}

class DetailViewDataFormatter: DetailViewDataFormatterProtocol {
    
    private var detailElement: CountryDetail?
    
    
    func setData(with response: CountryDetailResponse) {
        self.detailElement = response.data
    }
    
    func getItem() -> GenericDataProtocol? {
        return DetailViewComponentData(
            imageData: CustomImageViewComponentData(imageUrl: getImageUrl()),
            countryCode: getCountryCode(),
            id: getItemId())
    }
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return 1
    }
    
    func getImageUrl() -> String {
        return detailElement?.flagImageURI ?? ""
    }
    
    func getCountryCode() -> String {
        return detailElement?.code ?? ""
    }
    
    func getTitle() -> String {
        return detailElement?.name ?? ""
    }
    
    func getItemId() -> String {
        return detailElement?.wikiDataID ?? ""
    }
    
    
}
