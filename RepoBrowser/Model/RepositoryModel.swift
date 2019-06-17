//
//  Repository.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import Foundation

class RepositoryModel: Codable {
    let name: String
    let updatedAt: Date
    let url: String
    let language: String
    let license: License
    
    init(name: String, updatedAt: Date, url: String, language: String, license: License) {
        self.name = name
        self.updatedAt = updatedAt
        self.url = url
        self.language = language
        self.license = license
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case updatedAt = "updated_at"
        case url
        case language
        case license
    }
}

class License: Codable {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
