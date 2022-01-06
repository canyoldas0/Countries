//
//  File name: SavedViewController.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit
import BaseModules

class SavedViewController: BaseViewController<SavedViewModel> {
    
    private var tableViewComponent: CountryListView!
    
    override func prepareViewControllerSetup() {
        super.prepareViewControllerSetup()
        configureUI()
     
        listenViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getData()
    }
    
    private func configureUI() {
        addTableViewComponent()
    }
    
    private func addTableViewComponent() {
        tableViewComponent = CountryListView()
        tableViewComponent.translatesAutoresizingMaskIntoConstraints = false
        tableViewComponent.delegate = viewModel
        
        view.addSubview(tableViewComponent)
        
        tableViewComponent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    private func listenViewModel() {
        
        viewModel.subscribeViewState { [weak self] state in
            
            switch state {
            case .done:
                self?.tableViewComponent.reloadTableView()
            case .loading:
                return
            case .failure:
                return
            }
        }
    }
    
}
