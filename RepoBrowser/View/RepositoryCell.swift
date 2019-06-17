//
//  RepositoryCollectionViewCell.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import UIKit

class RepositoryCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    var viewModel: RepositoryCellViewModel?
    
    func setup() {
        viewModel?.setup()
    }
}

extension RepositoryCell : RepositoryCellProtocol {
    func setName(name:String) {
        self.nameLabel.text = name
    }
}
