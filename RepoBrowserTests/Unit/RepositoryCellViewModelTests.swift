//
//  RepositoryCellViewModelTests.swift
//  RepoBrowserTests
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import XCTest

class RepositoryCellViewModelTests: XCTestCase {

    private var repository: RepositoryModel?
    private var mockRepositoryCell: MockRepositoryCell?

    override func setUp() {
        repository = SampleRepositoryBuilder.buildSingleRepository()
        mockRepositoryCell = MockRepositoryCell()
    }

    
    func testShouldSetExpectedRopositoryName() {
        
        let expectation = self.expectation(description: "expected setName()  called")
        mockRepositoryCell?.expectationForSetName = (expectation, repository?.name)
        
        let viewModel =  RepositoryCellViewModel(model:repository)
        viewModel?.setView(mockRepositoryCell!)
        
        viewModel?.setup()
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

}
