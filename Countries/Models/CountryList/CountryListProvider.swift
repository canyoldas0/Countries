//
//  File name: CountryListProvider.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation

class CountryListProvider: ApiServiceProvider<CountryListRequest> {
    
    init(request: CountryListRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.rawValue,
                   path: Path.countryList.value,
                   data: request)
    }
}
