//
//  File name: HomeViewController.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit
import BaseModules
import SnapKit


class HomeViewController: BaseViewController<HomeViewModel> {
    
    private var homeView: HomeTableView!
    
    override func prepareViewControllerSetup() {
        super.prepareViewControllerSetup()
        configureUI()
        listenViewModel()
        viewModel.getData()
    }
    
    
    private func configureUI() {
        addHomeView()
    }
    
    private func addHomeView() {
        homeView = HomeTableView()
        homeView.delegate = viewModel
        view.addSubview(homeView)
        
        homeView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
    private func listenViewModel() {
        
        viewModel.subscribeListState { [weak self] state in
            
            switch state {
            case .done:
                self?.homeView.reloadTableView()
            case .loading:
                return
            case .failure:
                return
            }
        }
        
        viewModel.subscribeDetailRequestState { [weak self] request in
            self?.fireDetailView(with: request)
        }
    }
    
    private func fireDetailView(with data: CountryDetailRequest) {
        
        let viewController = DetailViewBuilder.build(with: data)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
