//
//  File name: DetailViewModel.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation

class DetailViewModel {
    
    private let dataFormatter: DetailViewDataFormatterProtocol
    private let request: CountryDetailRequest
    var viewState: ViewStateBlock?
    
    init(dataFormatter: DetailViewDataFormatterProtocol,
         request: CountryDetailRequest) {
        self.request = request
        self.dataFormatter = dataFormatter
    }
    
    private func getDetailRequest() -> CountryDetailRequest {
        
        return self.request
    }
    
    func subscribeViewState(with completion: @escaping ViewStateBlock) {
        self.viewState = completion
    }
    
    func getViewData() -> DetailViewComponentData {
        return dataFormatter.getItem() as! DetailViewComponentData
    }
    
    func getDetailData() {
        do {
            guard let urlRequest = try? CountryDetailProvider(with: getDetailRequest()).returnUrlRequest() else { return }
            viewState?(.loading)
            fireApiCall(with: urlRequest, with: dataListener)
        }
    }
    
    private func fireApiCall(with request: URLRequest, with completion : @escaping (Result<CountryDetailResponse, ErrorResponse>) -> Void) {
        
        NetworkManager.shared.sendRequest(urlRequest: request, completion: completion)
    }
    
    private func apiCallHandler(from response: CountryDetailResponse) {
        
        dataFormatter.setData(with: response)
        // We let VC know that we have data now.
        viewState?(.done)
        
    }
    
    private lazy var dataListener: (Result<CountryDetailResponse, ErrorResponse>) -> Void = { [weak self] result in
        
        switch result {
        case .failure(let error):
            return
        case .success(let response):
            self?.apiCallHandler(from: response)
        }
    }
  
}
 
