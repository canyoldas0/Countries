//
//  File name: SavedViewModel.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation

class SavedViewModel {
    
    var dataFormatter: HomeViewDataFormatterProtocol!
    var viewState: ViewStateBlock?
    var detailState: DetailRequestBlock?
    
     init(dataFormatter: HomeViewDataFormatterProtocol) {
        self.dataFormatter = dataFormatter
    }
    
    func subscribeViewState(with completion: @escaping ViewStateBlock) {
        self.viewState = completion
    }
    
    func subscribeDetailRequestState(with completion: @escaping DetailRequestBlock) {
        detailState = completion
    }
    
    func getData() {
        viewState?(.loading)
        self.dataFormatter.refresh()
        PersistencyDataManager.shared.getFavoriteItems { [weak self] data in
            self?.dataFormatter.setData(with: data)
            self?.viewState?(.done)
        }
    }
}

extension SavedViewModel: DataPersistencyStatusProtocol {
    
    func statusChanged() {
        self.getData()
    }
}

