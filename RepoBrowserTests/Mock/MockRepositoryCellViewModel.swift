//
//  MockRepositoryCellViewModel.swift
//  RepoBrowserTests
//
//  Created by Tomasz Studziński on 16/06/2019.
//


import Foundation
import XCTest

class MockRepositoryCellViewModel : RepositoryCellViewModel {
    
    var setupExpectation: XCTestExpectation?
    
    override func setup() {
        setupExpectation?.fulfill()
    }
}

