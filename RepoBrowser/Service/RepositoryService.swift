//
//  RepositoryService.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import Foundation
class RepositoryService {
    var apiService: APIService
    var cache: NSCache<NSString, NSArray>
    private let resultLimit = 10
    
    init(apiService: APIService = APIService(),
         cache: NSCache<NSString, NSArray> =  NSCache<NSString, NSArray>()) {
        self.apiService = apiService
        self.cache = cache
    }
    
    func fetchRepositories(then handler: @escaping (Result<[RepositoryModel], APIServiceError>) -> Void){
        let endpoint = Endpoint.repositories(resultsLimit: resultLimit)
        apiService.fetch(endpoint, then: { [weak self] (result: Result<[RepositoryModel], APIServiceError>) in
            switch result {
            case .success(let repositories):
                if let key = endpoint.cacheKey() {
                    self?.cache.setObject(repositories as NSArray, forKey: key as NSString)
                }
                handler(.success(repositories))
            case .failure(let error):
                handler(.failure(error))
            }
        })
    }
}

extension RepositoryService {
    func fetchRepositoriesFromCacheBySearchKey(_ searchKey: String,
                                            then handler: @escaping (Result<[RepositoryModel], APIServiceError>) -> Void) {
        let endpoint = Endpoint.repositories(resultsLimit: resultLimit)
        if let key = endpoint.cacheKey(),
            let repositories = self.cache.object(forKey: key as NSString) as? [RepositoryModel] {
            
            let filteredResult = repositories.filter( {
                if searchKey.count>0 {
                    return $0.name.range(of: searchKey, options: .caseInsensitive) != nil
                }
                return true
            })
            handler(.success(filteredResult))
        }else{
            handler(.failure(APIServiceError.noData))
        }
        
    }
    
}
