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

class CountryListView: GenericBaseView<CountryListViewData> {
    
    weak var delegate: ItemProviderProtocol?
    
    private lazy var tableViewComponent: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.separatorStyle = .none
        temp.estimatedRowHeight = UITableView.automaticDimension
        temp.rowHeight = UITableView.automaticDimension
        temp.register(CountryListTableViewCell.self, forCellReuseIdentifier: CountryListTableViewCell.identifier)
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
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableViewComponent.reloadData()
        }
    }
    
}

extension CountryListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.askNumberOfItem(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = delegate?.askData(at: indexPath.row) else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryListTableViewCell.identifier, for: indexPath) as? CountryListTableViewCell else {
            return UITableViewCell()
        }
        cell.setData(by: data)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
    
        cell?.isUserInteractionEnabled = false
        cell?.startTappedAnimation(with: { [weak self] finish in
            if finish {
                self?.delegate?.selectedItem(at: indexPath.row)
                cell?.isUserInteractionEnabled = true
               
            }
        })
    }
    
    
}
