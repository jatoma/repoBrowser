//
//  RepositoryDetailsProtocol.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 17/06/2019.
//

import Foundation
protocol RepositoryDetailsProtocol: class {
    func setName(name: String) -> Void
    func setLicense(license: String) -> Void
    func setLanguage(language: String) -> Void
    func setLastUpdate(updatedAt: Date) -> Void
}
