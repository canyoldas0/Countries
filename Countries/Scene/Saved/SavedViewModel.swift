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
    var persistencyManager: PersistencyDataProtocol!
    var viewState: ViewStateBlock?
    
     init(dataFormatter: HomeViewDataFormatterProtocol,
                  persistencyManager: PersistencyDataProtocol) {
        self.dataFormatter = dataFormatter
        self.persistencyManager = persistencyManager
    }
    
    func subscribeViewState(with completion: @escaping ViewStateBlock) {
        self.viewState = completion
    }
    
    func getData() {
        viewState?(.loading)
        self.dataFormatter.refresh()
        persistencyManager.getFavoriteItems { [weak self] data in
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

