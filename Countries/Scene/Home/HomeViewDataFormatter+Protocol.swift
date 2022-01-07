//
//  File name: HomeViewDataFormatter.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //) 
//  Date Created: 4.01.2022
//  
//

import Foundation
import BaseModules


protocol HomeViewDataFormatterProtocol {
    
    
    func setData(with response: [CountryData])
    func getItem(at index: Int) -> GenericDataProtocol?
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getTitle(at index: Int) -> String
    func getItemId(at index: Int) -> String
    func refresh()
}

class HomeViewDataFormatter: HomeViewDataFormatterProtocol {
    
    weak var delegate: DataPersistencyStatusProtocol?
        
    private var list: [CountryData] = [CountryData]()
    
    func setData(with response: [CountryData]) {
        self.list.append(contentsOf: response)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        return CountryListTableViewCellData(countryName: getTitle(at: index),
                                            saveButtonData:
                                                SaveButtonViewData(state: PersistencyDataManager.shared.checkExists(with: list[index]),
                                                                   isSaved: { [weak self] value in
            self?.saveItemOperation(at: index, with: value)
        })
        )
    }
    
    private func saveItemOperation(at index: Int, with value: Bool) {
        let item = list[index]
        value ? PersistencyDataManager.shared.addFavorite(with: item) : PersistencyDataManager.shared.removeFavourite(with: item)
        self.delegate?.statusChanged()
    }
    
    func refresh() {
        self.list.removeAll()
    }

    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return list.count
    }
    
    func getTitle(at index: Int) -> String {
        return list[index].name ?? ""
    }
    
    func getItemId(at index: Int) -> String {
        return list[index].wikiDataID ?? ""
    }
}
