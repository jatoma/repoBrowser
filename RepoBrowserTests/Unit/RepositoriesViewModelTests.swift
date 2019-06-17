//
//  RepositoriesCollectionViewModelTests.swift
//  RepoBrowserTests
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import XCTest

class RepositoriesViewModelTests: XCTestCase {

    fileprivate var mockCollectionViewController: MockRepositoriesViewController!

    override func setUp() {
        super.setUp()
        mockCollectionViewController = MockRepositoriesViewController()
    }


}
// MARK: initialization tests
extension RepositoriesViewModelTests {
    
    func testShouldKeepReferenceToView() {
        let viewModel = RepositoriesViewModel(view:mockCollectionViewController)
        XCTAssertTrue(mockCollectionViewController === viewModel.view)
    }

}

// MARK: numberOfRows tests
extension RepositoriesViewModelTests {
    func testShouldReturnZeroSectionsIfNoRepositories() {
        let viewModel = RepositoriesViewModel(view:mockCollectionViewController!)
        XCTAssertEqual(viewModel.numberOfSections(), 0)
    }
    
    func testShouldReturnExpectedNumberOfRowsAccordingToRepositoriesCount() {
        let viewModel = RepositoriesViewModel(view:mockCollectionViewController!)
        let sampleRepositories = SampleRepositoryBuilder.buildRepositoryList()
        
        let repositoriesModel = RepositoriesModel(repositoryService: nil)
        repositoriesModel.repositories = sampleRepositories
        viewModel.model = repositoriesModel
        XCTAssertEqual(viewModel.numberOfItemsInSection(viewModel.numberOfSections()), sampleRepositories.count)
    }

}



// Continuing in the simmilar way
