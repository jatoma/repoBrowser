//
//  UILabelStub.swift
//  RepoBrowserTests
//
//  Created by Tomasz Studziński on 16/06/2019.
//

import UIKit

class UILabelStub: UILabel {

    init() {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
