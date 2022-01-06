//
//  File name: CountryListRequest.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation

class CountryListRequest: Codable {

    private(set) var limit: Int
    
     init(limit: Int) {
        self.limit = limit
    }
}
