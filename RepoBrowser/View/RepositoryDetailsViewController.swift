//
//  RepositoryDetailsViewController.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 17/06/2019.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!
    
    var viewModel: RepositoryDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.performInitialViewSetup()
    }
}

extension RepositoryDetailsViewController : RepositoryDetailsProtocol {
    func setName(name: String) {
        nameLabel.text = name
    }
    
    func setLicense(license: String) {
        licenseLabel.text = license
    }
    
    func setLanguage(language: String) {
        languageLabel.text = language
    }
    
    func setLastUpdate(updatedAt: Date) {
        lastUpdateLabel.text = "Updated at \(updatedAt.dateAndTimetoString())"
    }
    


}
