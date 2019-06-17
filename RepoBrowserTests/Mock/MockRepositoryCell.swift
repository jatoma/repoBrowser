//
//  MockRepositoryCell.swift
//  RepoBrowserTests
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import Foundation
import XCTest

class MockRepositoryCell: RepositoryCellProtocol {
    
    var expectationForSetName:(XCTestExpectation, String?)?
    
    func setName(name:String) {
        guard let (expectation, expectedValue) = self.expectationForSetName else {
            return
        }
        
        if let expectedValue = expectedValue {
            if (name.compare(expectedValue) != .orderedSame) {
                return
            }
        }
        
        expectation.fulfill()
    }
    
}
