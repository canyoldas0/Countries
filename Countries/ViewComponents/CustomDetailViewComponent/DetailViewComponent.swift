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
    
    private lazy var countryName: UILabel = {
       let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = " "
        temp.font = .boldSystemFont(ofSize: 20)
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.textAlignment = .center
        return temp
    }()
    
    private lazy var stackView: UIStackView = {
       let temp = UIStackView(arrangedSubviews: [countryCodeLabel, saveButton])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .horizontal
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
        temp.font = .systemFont(ofSize: 16, weight: .medium)
        temp.lineBreakMode = .byWordWrapping
        temp.text = " "
        return temp
    }()
    
    private lazy var saveButton: SaveButtonView = {
       let temp = SaveButtonView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addViewElements()
    }
    
    private func addViewElements() {
        addSubview(countryName)
        addSubview(webView)
        addSubview(stackView)
        
        countryName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        webView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(countryName.snp.bottom).offset(20)
            make.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
            make.top.equalTo(webView.snp.bottom).offset(50)
        }
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        guard let url = URL(string: data.imageData) else { return }
        let request = URLRequest(url: url)
        
        DispatchQueue.main.async {
            self.webView.load(request)
            self.countryCodeLabel.text = data.countryCode
            self.countryName.text = data.countryTitle
            self.saveButton.setData(data: data.saveButtonData)
        }
       
    }
}
