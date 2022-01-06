//
//  File name: SaveButtonView.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //)
//  Date Created: 6.01.2022
//  
//

import UIKit
import BaseModules

class SaveButtonView: GenericBaseView<SaveButtonViewData> {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let temp = UIImageView(image: UIImage(systemName: "star.fill", compatibleWith: .current))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.tintColor = AppTheme.black.value
        temp.isUserInteractionEnabled = true
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        addTapGesture()
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        addSubview(containerView)
        containerView.addSubview(imageView)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(36)
            make.width.equalTo(36)
        }
    }
    
    private func colorManager() {
        guard let data = returnData() else { return }
        if data.state {
            imageView.tintColor = .red
        } else {
            imageView.tintColor = AppTheme.black.value
        }
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        colorManager()
    }
    
}

extension SaveButtonView: UIGestureRecognizerDelegate {
    
    @objc fileprivate func saveTapped(_ sender: UITapGestureRecognizer) {
        guard let data = returnData() else { return }
        isUserInteractionEnabled = false
        data.state.toggle()
        colorManager()
        startPressedAnimationCommon(withDuration: 0.3) { [weak self] finish in
            self?.isUserInteractionEnabled = true
            data.isSaved(data.state)
        }
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: .saveTapped)
        tap.delegate = self
        self.addGestureRecognizer(tap)
    }
}

fileprivate extension Selector {
    static let saveTapped = #selector(SaveButtonView.saveTapped)
}
