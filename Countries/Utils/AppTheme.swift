//
//  File name: AppTheme.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //) 
//  Date Created: 4.01.2022
//  
//

import UIKit
import BaseModules

enum AppTheme: GenericValueProtocol {
    typealias Value = UIColor
    
    var value: UIColor {
        switch self {
            
        case .primary:
            return UIColor(red: 0.01, green: 0.09, blue: 0.15, alpha: 1.00)
        case .secondary:
            return UIColor(red: 0.00, green: 0.79, blue: 0.56, alpha: 1.00)
        case .white:
            return .white
        case .black:
            return .black
        }
    }
    
    case primary
    case secondary
    case white
    case black
}
