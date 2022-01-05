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
import WebKit

class DetailViewComponent: GenericBaseView<DetailViewComponentData> {
    
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.heightAnchor.constraint(equalToConstant: 196).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 108).isActive = true
        return temp
    }()
    
    private lazy var webView: WKWebView = {
       let temp = WKWebView()
        temp.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(webView)
        addSubview(countryCodeLabel)
        
        webView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        countryCodeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalTo(webView.snp.bottom).offset(50)
        }
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
//        imageContainer.setData(data: data.imageData)
        guard let url = URL(string: data.imageData.imageUrl) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        countryCodeLabel.text = data.countryCode
    }
}
