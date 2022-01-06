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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getDetailData()
    }
    
    private func configureUI() {
        addDetailView()
    }
    
    private func addDetailView() {
        detailView = DetailViewComponent()
        view.addSubview(detailView)
        
        detailView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().inset(150)
            make.trailing.equalToSuperview()
        }
    }
    
    private func listenViewModel() {
        
        viewModel.subscribeViewState { [weak self] state in
            
            switch state {
            case .done:
                self?.detailView.setData(data: self?.viewModel.getViewData())
            case .failure:
                return
            case .loading:
                return
            }
        }
    }
}
