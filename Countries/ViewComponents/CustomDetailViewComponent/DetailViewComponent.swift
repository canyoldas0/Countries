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
    
    private lazy var webView: WKWebView = {
       let temp = WKWebView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private var countryCodeLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.numberOfLines = 0
        temp.font = .systemFont(ofSize: 16, weight: .medium)
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
        guard let url = URL(string: data.imageData) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        countryCodeLabel.text = data.countryCode
    }
}
