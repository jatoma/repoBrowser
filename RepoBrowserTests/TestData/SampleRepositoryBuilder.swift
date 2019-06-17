//
//  SampleRepositoryBuilder.swift
//  RepoBrowserTests
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import UIKit

class SampleRepositoryBuilder {
    
    public static func buildSingleRepository() -> RepositoryModel {
        return RepositoryModel(name: "Applause Repo",
                                updatedAt: Date(),
                                 url: "htttp://sample.com",
                                 language: "swift",
                                 license: License(name: "Apache 2.0"))
    }
    
    
    public static func buildRepositoryList() -> [RepositoryModel] {
        var repositories: [RepositoryModel] = []
        
        for _ in 1...Int.random(in: 5 ..< 10) {
            repositories.append(buildSingleRepository())
        }
        
        return repositories
    }
    
    public static func repositoriesData() -> Data {
        let bundle = Bundle(for: SampleRepositoryBuilder.self)
        let url = bundle.url(forResource: "repos", withExtension: "json")!
        let data = try! Data(contentsOf: url)        
        return data
    }
}
