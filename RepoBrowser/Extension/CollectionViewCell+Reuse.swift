//
//  CollectionViewCell+Reuse.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import UIKit
public extension UICollectionViewCell {

    static var uniqueIdentifier: String {
        return String(describing: self)
    }
}
