//
//  File name: DetailViewModel.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation

class DetailViewModel {
    
    let request: CountryDetailRequest
    let dataFormatter: DetailViewDataFormatterProtocol
    var viewState: ViewStateBlock?
    
    init(dataFormatter: DetailViewDataFormatterProtocol,
         request: CountryDetailRequest) {
        self.request = request
        self.dataFormatter = dataFormatter
    }
    
    func subscribeViewState(with completion: @escaping ViewStateBlock) {
        self.viewState = completion
    }
    
    lazy var dataListener: (Result<CountryDetailResponse, ErrorResponse>) -> Void = { [weak self] result in
       
       switch result {
       case .failure(let error):
           return
       case .success(let response):
           self?.apiCallHandler(from: response)
       }
   }
}
 
