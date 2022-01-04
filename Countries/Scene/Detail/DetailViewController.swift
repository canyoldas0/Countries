//
//  File name: DetailViewController.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit
import BaseModules

class DetailViewController: BaseViewController<DetailViewModel> {
    
    private var detailView: DetailView!
    
    override func prepareViewControllerSetup() {
        super.prepareViewControllerSetup()
        configureUI()
        listenViewModel()
        viewModel.getDetailData()
    }
    
    
    private func configureUI() {
        addDetailView()
    }
    
    private func addDetailView() {
        detailView = DetailView()
        detailView.delegate = viewModel
        view.addSubview(detailView)
        
        detailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    
    private func listenViewModel() {
        
        viewModel.subscribeViewState { [weak self] state in
            
            switch state {
            case .done:
                self?.detailView.reloadTableView()
            case .failure:
                return
            case .loading:
                return
            }
        }
    }
}
