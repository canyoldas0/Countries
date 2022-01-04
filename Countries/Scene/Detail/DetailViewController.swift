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
    
    private var detailView: DetailViewComponent!
    
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
        detailView = DetailViewComponent()
        view.addSubview(detailView)
        detailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setViewData() {
        DispatchQueue.main.async {
            self.detailView.setData(data: self.viewModel.getViewData())
        }
    }
    
    private func listenViewModel() {
        
        viewModel.subscribeViewState { [weak self] state in
            
            switch state {
            case .done:
                self?.setViewData()
            case .failure:
                return
            case .loading:
                return
            }
        }
    }
}
