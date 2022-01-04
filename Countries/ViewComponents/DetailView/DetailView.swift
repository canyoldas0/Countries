//
//  File name: DetailView.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit
import BaseModules

class DetailView: GenericBaseView<DetailViewData> {
    
    weak var delegate: ItemProviderProtocol?
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.allowsSelection = false
        temp.bounces = false
        temp.separatorStyle = .none
        temp.estimatedRowHeight = 600
        temp.rowHeight = UITableView.automaticDimension
        temp.showsVerticalScrollIndicator = false
        temp.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addTableView()
    }
    
    private func addTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


extension DetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        delegate?.askNumberOfItem(in: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = delegate?.askData(at: indexPath.row) else { fatalError("Couldnt get any data") }
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailTableViewCell.identifier,
            for: indexPath) as? DetailTableViewCell else { fatalError("Couldnt get any data") }
        
        cell.setData(by: data)
        return cell
    }
}
