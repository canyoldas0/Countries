//
//  File name: SaveButtonViewData.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //) 
//  Date Created: 6.01.2022
//  
//

import Foundation

class SaveButtonViewData {
    
    public var state: Bool
    private(set) var isSaved: BooleanBlock
    
    init(state: Bool, isSaved: @escaping BooleanBlock) {
        self.state = state
        self.isSaved = isSaved
    }
}
