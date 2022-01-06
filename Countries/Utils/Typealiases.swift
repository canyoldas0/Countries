//
//  File name: Typealiases.swift
//  Description: <#Description#>
//  Author: Can Yoldas (employee ID: //) 
//  Date Created: 4.01.2022
//  
//

import Foundation


typealias ViewStateBlock = (ViewState) -> Void
typealias DetailRequestBlock = (CountryDetailRequest) -> Void
typealias BooleanBlock = (Bool) -> Void
typealias DetailResultBlock = (Result<CountryDetailResponse, ErrorResponse>) -> Void
typealias ListResultBlock = (Result<CountryListResponse, ErrorResponse>) -> Void)
