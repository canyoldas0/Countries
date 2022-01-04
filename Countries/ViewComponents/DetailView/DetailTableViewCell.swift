//
//  File name: DetailTableViewCell.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 4.01.2022
//  
//

import UIKit
import BaseModules

class DetailTableViewCell: BaseTableViewCell {
    
    private lazy var detailViewComponent: DetailViewComponent = {
        let temp = DetailViewComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    
    override func addMajorViews() {
        super.addMajorViews()
        addViewComponent()
    }
    
    private func addViewComponent() {
        contentView.addSubview(detailViewComponent)
        
        detailViewComponent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setData(by data: GenericDataProtocol) {
        guard let data = data as? DetailViewComponentData else { return }
        detailViewComponent.setData(data: data)
    }
}
