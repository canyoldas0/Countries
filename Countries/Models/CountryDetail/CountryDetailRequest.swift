//
//  File name: CountryDetailRequest.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation

class CountryDetailRequest: Codable {
    
    private(set) var id: String
    
    init(id: String) {
        self.id = id
    }
}
