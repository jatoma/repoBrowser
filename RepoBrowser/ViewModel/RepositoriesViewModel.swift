//
//  RepositoriesCollectionViewModel.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import UIKit

class RepositoriesViewModel {
    weak var view: RepositoriesProtocol?
    var model: RepositoriesModel
    
    init(view: RepositoriesProtocol, model: RepositoriesModel = RepositoriesModel(),
         repositoryService: RepositoryService? = RepositoryService()) {
        
        self.view = view
        self.model = model
    }
    
    func performInitialViewSetup() {
        model.load(then: { [weak self] (result: Result<Void, APIServiceError>) in
            switch result {
            case .success():
                DispatchQueue.main.async {
                    self?.view?.reloadCollectionView()
                }
            case .failure(let error):
                print(error.localizedDescription) //TODO error handling
            }
        })
    }
    
    func numberOfSections() -> Int {
        guard let _ = model.repositories else { return 0 }
        
        return 1
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        guard let repositories = model.repositories else { return 0 }
        
        return repositories.count
    }
    
    func performSearchWithText(searchText: String){
        model.loadFilteredByName(searchText: searchText, then: { [weak self] (result: Result<Void, APIServiceError>) in
            switch result {
            case .success():
                DispatchQueue.main.async {
                    self?.view?.reloadCollectionView()
                }
            case .failure(let error):
                print(error.localizedDescription) //TODO error handling
            }
        })
    }
    
    func cellViewModel(indexPath:IndexPath) -> RepositoryCellViewModel? {
        
        guard let repositories = model.repositories, repositories.count > indexPath.row else {
            return nil
        }
        
        return RepositoryCellViewModel(model:repositories[indexPath.row])
    }
    
}
