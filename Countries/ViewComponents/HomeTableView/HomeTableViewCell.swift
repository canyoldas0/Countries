//
//  File name: HomeTableViewCell.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit
import BaseModules

class HomeTableViewCell: BaseTableViewCell {
    
    private lazy var container: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.borderColor = AppTheme.primary.value.cgColor
        temp.layer.borderWidth = 2
        temp.layer.cornerRadius = 20
        return temp
    }()
    
    private lazy var contryNameLabel: UILabel = {
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
    
    
}
