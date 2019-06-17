//
//  Repositories.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 17/06/2019.
//

import Foundation
class RepositoriesModel {
    var repositories: [RepositoryModel]?
    var repositoryService: RepositoryService?
    
    init(repositoryService: RepositoryService? = RepositoryService() ) {
        self.repositoryService = repositoryService
    }
    
    func load(then handler: @escaping (Result<Void, APIServiceError>) -> Void) {
         repositoryService?.fetchRepositories(then: { [weak self] (result: Result<[RepositoryModel], APIServiceError>) in
            switch result {
            case .success(let repositories):
                self?.repositories = repositories
                handler(.success(()))
            case .failure(let error):
                handler(.failure(error))
            }
        })
    }
    
    func loadFilteredByName(searchText: String, then handler: @escaping (Result<Void, APIServiceError>) -> Void) {
          repositoryService?.fetchRepositoriesFromCacheBySearchKey(searchText,
                                                then: { [weak self] (result: Result<[RepositoryModel], APIServiceError>) in
          switch result {
            case .success(let repositories):
                self?.repositories = repositories
                handler(.success(()))
            case .failure(let error):
                handler(.failure(error))
            }
        })
    }
}
