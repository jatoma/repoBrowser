//
//  MockRepositoriesCollectionViewController.swift
//  RepoBrowserTests
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import UIKit
import XCTest

class MockRepositoriesViewController : RepositoriesProtocol {
    var expectationForReloadCollectionView:XCTestExpectation?
    
    func reloadCollectionView() {
        expectationForReloadCollectionView?.fulfill()
    }
}
