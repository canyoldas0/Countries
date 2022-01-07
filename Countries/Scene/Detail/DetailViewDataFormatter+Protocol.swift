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
    func getItem() -> DetailViewComponentData
    func getTitle() -> String
    func getItemId() -> String
    func getImageUrl() -> String
    func getCountryCode() -> String
}

class DetailViewDataFormatter: DetailViewDataFormatterProtocol {
    
    private var detailElement: CountryDetail?
    
    func setData(with response: CountryDetailResponse) {
        self.detailElement = response.data
    }
    
    func createCountryData() -> CountryData {
        return CountryData(code: getCountryCode(),
                           currencyCodes: nil, name: getTitle(), wikiDataID: getItemId())
    }
    
    func getItem() -> DetailViewComponentData {
        return DetailViewComponentData(
            imageData: getImageUrl(),
            countryCode: getCountryCode(),
            id: getItemId(),
            countryTitle: getTitle(),
            saveButtonData: SaveButtonViewData(state: PersistencyDataManager.shared.checkExists(with: createCountryData()),
                                               isSaved: saveItemListener))
        
    }
    
    private func saveItemOperation(with value: Bool) {
        let item = createCountryData()
        value ? PersistencyDataManager.shared.addFavorite(with: item) : PersistencyDataManager.shared.removeFavourite(with: item)
    }
    
    private lazy var saveItemListener: BooleanBlock = { [weak self] value in
        self?.saveItemOperation(with: value)
    }
        
    func getImageUrl() -> String {
        return detailElement?.flagImageURI ?? ""
    }
    
    func getCountryCode() -> String {
        return "Country code: \(detailElement?.code ?? "")"
    }
    
    func getTitle() -> String {
        return detailElement?.name ?? ""
    }
    
    func getItemId() -> String {
        return detailElement?.wikiDataID ?? ""
    }
    
    
}
