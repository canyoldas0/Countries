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

    // MARK: Callbacks
    
     lazy var apiCallHandler: ListResultBlock = { [weak self] result in
        
        switch result {
        case .success(let data):
            self?.dataHandler(with: data)
        case .failure(let error):
            print(error)
        }
    }
    
}
