//
//  File name: DetailViewModel+Network.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //) 
//  Date Created: 5.01.2022
//  
//

import Foundation

extension DetailViewModel {
    
    
    private func getDetailRequest() -> CountryDetailRequest {
        
        return self.request
    }
    
    func getDetailData() {
        do {
            guard let urlRequest = try? CountryDetailProvider(with: getDetailRequest()).returnUrlRequest() else { return }
            viewState?(.loading)
            fireApiCall(with: urlRequest, with: dataListener)
        }
    }
    
    private func fireApiCall(with request: URLRequest, with completion : @escaping DetailResultBlock) {
        
        NetworkManager.shared.sendRequest(urlRequest: request, completion: completion)
    }
    
    func apiCallHandler(from response: CountryDetailResponse) {
        
        dataFormatter.setData(with: response)
        // We let VC know that we have data now.
        viewState?(.done)
        
    }
    
    
}
