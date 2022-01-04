//
//  File name: CountryListResponse.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation

struct CountryListResponse: Codable {
    let data: [CountryData]
    let links: [Link]?
    let metadata: Metadata?
}

// MARK: - Datum
struct CountryData: Codable {
    let code: String?
    let currencyCodes: [String]?
    let name, wikiDataID: String?

    enum CodingKeys: String, CodingKey {
        case code, currencyCodes, name
        case wikiDataID = "wikiDataId"
    }
}

// MARK: - Link
struct Link: Codable {
    let rel, href: String?
}

// MARK: - Metadata
struct Metadata: Codable {
    let currentOffset, totalCount: Int?
}
