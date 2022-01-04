//
//  File name: CountryDetailProvider.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation

class CountryDetailProvider: ApiServiceProvider<CountryDetailRequest> {
    
    init(with request: CountryDetailRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.rawValue,
                   path: Path.countryDetail(request.id).value,
                   data: request)
    }
}
