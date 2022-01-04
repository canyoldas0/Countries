//
//  File name: ItemProviderProtocol.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //) 
//  Date Created: 31.12.2021
//  
//

import Foundation
import BaseModules

protocol ItemProviderProtocol: AnyObject {
    
    func askNumberOfSection() -> Int
    func askNumberOfItem(in section: Int) -> Int
    func askData(at index: Int) -> GenericDataProtocol?
    func selectedItem(at index: Int)
    func getMoreData()
    func isLoadingCell(for index: Int) -> Bool
    func askHeaderData(in section: Int) -> GenericDataProtocol?
}

extension ItemProviderProtocol {
    func selectedItem(at index: Int) { }
    func getMoreData() { }
    func isLoadingCell(for index: Int) -> Bool { return false }
    func askHeaderData(in section: Int) -> GenericDataProtocol? { return nil }
}
