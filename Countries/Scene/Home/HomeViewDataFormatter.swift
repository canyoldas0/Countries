//
//  File name: HomeViewDataFormatter.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: c84203180) 
//  Date Created: 4.01.2022
//  
//

import Foundation
import BaseModules


protocol HomeViewDataFormatterProtocol {
    
    
    func setData(with response: CountryListResponse)
    func getItem(at index: Int) -> GenericDataProtocol?
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getTitle(at index: Int) -> String
    func getItemId(at index: Int) -> String
}

class HomeViewDataFormatter: HomeViewDataFormatterProtocol {
    
    
    private var list: [CountryData] = [CountryData]()
    
    func setData(with response: CountryListResponse) {
        self.list.append(contentsOf: response.data)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        return nil
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
