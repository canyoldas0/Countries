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

class CountryListTableViewCell: BaseTableViewCell {
    
    private lazy var container: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.borderColor = AppTheme.primary.value.cgColor
        temp.layer.borderWidth = 2
        temp.layer.cornerRadius = 15
        return temp
    }()
    
    private lazy var stackView: UIStackView = {
       let temp = UIStackView(arrangedSubviews: [countryNameLabel,saveButton])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .horizontal
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
    
    private lazy var saveButton: SaveButtonView = {
       let temp = SaveButtonView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    
    override func addMajorViews() {
        super.addMajorViews()
        addViewComponents()
    }
    
    private func addViewComponents() {
        contentView.addSubview(container)
        container.addSubview(stackView)
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setData(by data: GenericDataProtocol) {
        guard let data = data as? CountryListTableViewCellData else { return }
        saveButton.setData(data: data.saveButtonData)
        countryNameLabel.text = data.countryName
    }
}
