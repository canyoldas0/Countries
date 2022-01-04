//
//  File name: CountryDetailResponse.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation

struct CountryDetailResponse: Codable {
    let data: CountryDetail?
}

// MARK: - DataClass
struct CountryDetail: Codable {
    let capital, code, callingCode: String?
    let currencyCodes: [String]?
    let flagImageURI: String?
    let name: String?
    let numRegions: Int?
    let wikiDataID: String?

    enum CodingKeys: String, CodingKey {
        case capital, code, callingCode, currencyCodes
        case flagImageURI = "flagImageUri"
        case name, numRegions
        case wikiDataID = "wikiDataId"
    }
}
