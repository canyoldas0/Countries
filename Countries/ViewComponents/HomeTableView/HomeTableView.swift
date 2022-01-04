//
//  File name: HomeTableView.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import Foundation
import BaseModules
import UIKit
import SnapKit

class HomeTableView: GenericBaseView<HomeTableViewData> {
    
    weak var delegate: ItemProviderProtocol?
    
    private lazy var tableViewComponent: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.separatorStyle = .none
        temp.estimatedRowHeight = UITableView.automaticDimension
        temp.rowHeight = UITableView.automaticDimension
//        temp.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addTableViewComponent()
    }
    
    private func addTableViewComponent() {
        addSubview(tableViewComponent)
        
        tableViewComponent.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

extension HomeTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.askNumberOfItem(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
