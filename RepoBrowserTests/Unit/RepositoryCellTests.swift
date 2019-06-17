//
//  RepositoryCellViewModelTests.swift
//  RepoBrowserTests
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import XCTest

class RepositoryCellTests: XCTestCase {

    private var repository: RepositoryModel?

    override func setUp() {
        repository = SampleRepositoryBuilder.buildSingleRepository()
    }

    
      func testShouldSetupViewWithViewModel() {
        
        let expectation = self.expectation(description: "expected setup() to call")
        
        let repositoryCell = RepositoryCell()
        let labelStub = UILabelStub()
        repositoryCell.nameLabel = labelStub
        let viewModel = MockRepositoryCellViewModel(model:repository)
        viewModel!.setupExpectation = expectation
        repositoryCell.viewModel = viewModel
        
        //when
        repositoryCell.setup()
        
        //then
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    

}
