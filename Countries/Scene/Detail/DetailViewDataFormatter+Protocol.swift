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
    func getItem(at index: Int) -> GenericDataProtocol?
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getTitle(at index: Int) -> String
    func getItemId(at index: Int) -> String
    func getImageUrl(at index: Int) -> String
    func getCountryCode(at index: Int) -> String
}

class DetailViewDataFormatter: DetailViewDataFormatterProtocol {
    
    private var detailElement: [CountryDetail?] = [CountryDetail]()
    
    
    func setData(with response: CountryDetailResponse) {
        self.detailElement.append(response.data)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        return DetailViewComponentData(
            imageData: CustomImageViewComponentData(imageUrl: getImageUrl(at: index)),
            countryCode: getCountryCode(at: index),
            id: getItemId(at: index))
    }
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return detailElement.count
    }
    
    func getImageUrl(at index: Int) -> String {
        return detailElement[index]?.flagImageURI ?? ""
    }
    
    func getCountryCode(at index: Int) -> String {
        return detailElement[index]?.code ?? ""
    }
    
    func getTitle(at index: Int) -> String {
        return detailElement[index]?.name ?? ""
    }
    
    func getItemId(at index: Int) -> String {
        return detailElement[index]?.wikiDataID ?? ""
    }
    
    
}
