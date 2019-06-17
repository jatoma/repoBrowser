//
//  RepositoryServiceTests.swift
//  RepoBrowserTests
//
//  Created by Tomasz Studziński on 17/06/2019.
//

import XCTest

class RepositoryServiceTests: XCTestCase {

    override func setUp() {

    }

    func testFetchRepositories() {
    
        //URL SessionMock
        let mockUrlSession = MockURLSession()
        let expectationDataTask = self.expectation(description: "Expected dataTask called ")
        let expectationDataTaskResume = self.expectation(description: "Expected dataTask resume called ")
        let expectationRepositoriesResult = self.expectation(description: "Expected repositories as a result ")
        
        mockUrlSession.dataTaskExpectation = expectationDataTask
        mockUrlSession.dataTaskMock?.dataToReturn = SampleRepositoryBuilder.repositoriesData()
        mockUrlSession.dataTaskMock?.resumeExpectation = expectationDataTaskResume
        
        //Api Service Mock
        let apiService = APIService()
        apiService.urlSession = mockUrlSession
        
        //When
        let repositoryService = RepositoryService(apiService: apiService)
        repositoryService.fetchRepositories(then: { (result: Result<[RepositoryModel], APIServiceError>) in
            switch result {
            case .success(let repositories):
                assert(repositories.count > 0)
                expectationRepositoriesResult.fulfill()
            case .failure(let error):
                assertionFailure(error.localizedDescription)
            }
        })
        
        //Then
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}
