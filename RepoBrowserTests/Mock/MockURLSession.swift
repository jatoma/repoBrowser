//
//  MockUrlSession.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 17/06/2019.
//

import Foundation
import XCTest

class MockURLSession : URLSession {
    
    var dataTaskExpectation: XCTestExpectation?
    var dataTaskMock: MockURLSessionDataTask?
    
    override init() {
        self.dataTaskMock = MockURLSessionDataTask()
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask {
        if let dataTaskExpectation = self.dataTaskExpectation {
            dataTaskExpectation.fulfill()
        }
        
        self.dataTaskMock?.completionHandler = completionHandler
        return self.dataTaskMock!
    }
}

class MockURLSessionDataTask : URLSessionDataTask {
    
    var resumeExpectation: XCTestExpectation?
    
    var completionHandler:((Data?, URLResponse?, Error?) -> Swift.Void)?
    var dataToReturn:Data?
    var urlResponseToReturn:URLResponse?
    var errorToReturn:Error?
    
    override func resume() {
        resumeExpectation?.fulfill()
        
        if let completionHandler = completionHandler {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                completionHandler(self.dataToReturn, self.urlResponseToReturn, self.errorToReturn)
            }
        }
    }
}
