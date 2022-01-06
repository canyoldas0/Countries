//
//  File name: HomeViewModel+Network.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //) 
//  Date Created: 6.01.2022
//  
//

import Foundation

extension HomeViewModel {
    
    private func getListRequest() -> CountryListRequest {
        return CountryListRequest()
    }
    
    // MARK: Network Request Methods
    func getData() {
        do {
            guard let urlRequest = try? CountryListProvider(request: getListRequest()).returnUrlRequest() else { return }
            fireApiCall(with: urlRequest, with: apiCallHandler)
        }
    }
    
    func fireApiCall(with request: URLRequest, with completion: @escaping ListResultBlock) {
        
        NetworkManager.shared.sendRequest(urlRequest: request, completion: completion)
    }
    
    func dataHandler(with response: CountryListResponse) {
        dataFormatter.refresh()
        dataFormatter.setData(with: response.data)
        listState?(.done)
    }
    
}
