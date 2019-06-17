//
//  RepositoriesCollectionViewController.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import UIKit

class RepositoriesViewController: UICollectionViewController {
    var viewModel: RepositoriesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.viewModel == nil {
            self.viewModel = RepositoriesViewModel(view: self)
        }
        
        self.viewModel?.performInitialViewSetup()
    }
    
    // MARK: UITextFiled - Search delegate
    @IBAction func textDidChange(_ sender: Any) {
        guard let textfield = sender as? UITextField, let text = textfield.text else { return }
        viewModel?.performSearchWithText(searchText: text)
    }
    
}

// MARK: RepositoriesProtocol
extension  RepositoriesViewController: RepositoriesProtocol {
    func reloadCollectionView() {
        self.collectionView?.reloadData()
    }
}

// MARK: UICollectionViewDataSource
extension  RepositoriesViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        
        return viewModel.numberOfSections()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        
        return viewModel.numberOfItemsInSection(section)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepositoryCell.uniqueIdentifier, for: indexPath)
        
        guard let viewModel = viewModel,
            let collectionViewCell = cell as? RepositoryCell,
            let cellViewModel = viewModel.cellViewModel(indexPath:indexPath) else {
                return cell
        }
        
        collectionViewCell.viewModel = cellViewModel
        cellViewModel.setView(collectionViewCell)
        
        collectionViewCell.setup()
        return collectionViewCell
    }
}

// MARK: - Navigation
extension  RepositoriesViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  let cell = sender as? RepositoryCell,
            let cellViewModel = cell.viewModel,
            let detailsController = segue.destination as? RepositoryDetailsViewController else { return }
        
        let detailsViewModel = RepositoryDetailsViewModel(view: detailsController, repository: cellViewModel.repository)
        detailsController.viewModel = detailsViewModel
    }
}
