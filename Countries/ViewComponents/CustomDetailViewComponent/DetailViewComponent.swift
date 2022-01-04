//
//  File name: DetailViewComponent.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit
import SnapKit
import BaseModules

class DetailViewComponent: GenericBaseView<DetailViewComponentData> {
    
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.heightAnchor.constraint(equalToConstant: 196).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 108).isActive = true
        return temp
    }()
    
    private var countryCodeLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.numberOfLines = 0
        temp.font = .systemFont(ofSize: 14, weight: .medium)
        temp.lineBreakMode = .byWordWrapping
        temp.text = " "
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addViewElements()
    }
    
    private func addViewElements() {
        addSubview(imageContainer)
        addSubview(countryCodeLabel)
        
        imageContainer.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview()
        }
        
        countryCodeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalTo(imageContainer.snp.bottom).inset(30)
        }
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        imageContainer.setData(data: data.imageData)
        countryCodeLabel.text = data.countryCode
    }
}
