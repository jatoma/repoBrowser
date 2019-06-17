//
//  MockRepositoryViewModel.swift
//  RepoBrowserTests
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import Foundation
import XCTest

class MockRepositoryViewModel: RepositoriesViewModel {
    var performInitialViewSetupExpectation:XCTestExpectation?
    var numberOfItemsExpectation:(XCTestExpectation)?
    var cellViewModelExpectation:(XCTestExpectation, expectedIndexPath:IndexPath)?
 
    
    override func performInitialViewSetup() {
        performInitialViewSetupExpectation?.fulfill()
    }
    
    override func numberOfItemsInSection(_ section: Int) -> Int {
        numberOfItemsExpectation?.fulfill()
        return 0
    }
    
    override func cellViewModel(indexPath:IndexPath) -> RepositoryCellViewModel? {
        if let (expectation, expectedValue) = self.cellViewModelExpectation {
            if indexPath == expectedValue {
                expectation.fulfill()
            }
        }
        
        return nil
    }

}
