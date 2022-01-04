//
//  File name: HomeTableViewCell.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit
import BaseModules
import SnapKit

class HomeTableViewCell: BaseTableViewCell {
    
    private lazy var container: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.borderColor = AppTheme.primary.value.cgColor
        temp.layer.borderWidth = 2
        temp.layer.cornerRadius = 15
        return temp
    }()
    
    private lazy var countryNameLabel: UILabel = {
        let temp = UILabel()
        temp.textAlignment = .left
        temp.text = "Turkey "
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .boldSystemFont(ofSize: 16)
        temp.textColor = AppTheme.black.value
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        return temp
    }()
    
    
    override func addMajorViews() {
        super.addMajorViews()
        addViewComponents()
    }
    
    private func addViewComponents() {
        contentView.addSubview(container)
        container.addSubview(countryNameLabel)
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        countryNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    func setData(by data: GenericDataProtocol) {
        guard let data = data as? HomeTableViewCellData else { return }
        countryNameLabel.text = data.countryName
    }
}
