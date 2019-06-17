//
//  RepositoriesCollectionViewCellViewModel.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import UIKit

class RepositoryCellViewModel {
    weak var repository: RepositoryModel?
    weak var cell: RepositoryCellProtocol?
    
    init?(model:RepositoryModel?) {
        
        guard let model = model else {
            return nil
        }
        
        self.repository = model
    }
    
    func setView(_ view: RepositoryCellProtocol) {
        self.cell = view
    }
    
    func setup() {
        guard let repository = repository, let cell = cell else {
            return
        }
        
        cell.setName(name: repository.name)
    }
}
