//
//  RepositoryDetailsViewModel.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 17/06/2019.
//

import Foundation
class RepositoryDetailsViewModel {
    weak var view: RepositoryDetailsProtocol?
    var model: RepositoryModel?
    
    init(view: RepositoryDetailsProtocol, repository: RepositoryModel? ) {
        self.view = view
        self.model = repository
    }
    
    func performInitialViewSetup() {
        guard let model = model else { return }
    
        view?.setName(name: model.name)
        view?.setLicense(license: model.license.name)
        view?.setLanguage(language: model.language)
        view?.setLastUpdate(updatedAt: model.updatedAt)
    }
}
