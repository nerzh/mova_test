//
//  searchBar.swift
//  mova
//
//  Created by Oleg Gudejchuk on 19.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//

import Foundation
import UIKit

class SearchField : UITextField {
    
    let image = "search2"
    
    init(x: CGFloat = 0, y: CGFloat = 0, width: CGFloat = 1, height: CGFloat = 30) {
        super.init(frame: CGRect.init(x: x, y: y, width: width, height: height))
        settingsApply()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchField {
    fileprivate func settingsApply() {
        self.backgroundColor    = UIColor.white
        self.leftViewMode       = UITextFieldViewMode.always
        let imageView           = UIImageView.init(image: UIImage.init(named: image))
        imageView.contentMode   = UIViewContentMode.scaleAspectFit
        imageView.frame         = CGRect.init(x: self.frame.minX, y: self.frame.minY, width: 25, height: 25)
        self.leftView           = imageView
        self.layer.cornerRadius = 3
    }
}




