//
//  File name: HomeViewModel.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation

class HomeViewModel {
    
    var dataFormatter: HomeViewDataFormatterProtocol!
    var listState: ViewStateBlock?
    var detailState: DetailRequestBlock?
    
    init(dataFormatter: HomeViewDataFormatterProtocol) {
        self.dataFormatter = dataFormatter
    }
    
    // MARK: Model States
    func subscribeListState(with completion: @escaping ViewStateBlock) {
        listState = completion
    }
    
    func subscribeDetailRequestState(with completion: @escaping DetailRequestBlock) {
        detailState = completion
    }
    
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
    
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<CountryListResponse, ErrorResponse>) -> Void) {
        
        NetworkManager.shared.sendRequest(urlRequest: request, completion: completion)
    }
    
    private func dataHandler(with response: CountryListResponse) {
        dataFormatter.setData(with: response.data)
        listState?(.done)
    }
    
    private lazy var apiCallHandler: (Result<CountryListResponse, ErrorResponse>) -> Void = { [weak self] result in
        
        switch result {
        case .success(let data):
            self?.dataHandler(with: data)
        case .failure(let error):
            print(error)
        }
    }
    
}
