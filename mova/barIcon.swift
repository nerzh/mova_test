//
//  chatIcon.swift
//  mova
//
//  Created by Oleg Gudejchuk on 19.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//
import UIKit
import Foundation

class BarIco : UIImageView {
    let width  : CGFloat
    let height : CGFloat
    
    init (image: UIImage?, width: CGFloat = 0, height: CGFloat = 0) {
        self.width  = width
        self.height = height
        
        super.init(image: image)
        settingsApply()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BarIco {
    fileprivate func settingsApply() {
        self.contentMode = UIViewContentMode.scaleAspectFit
        self.frame       = CGRect.init(x: 0, y: 0, width: width, height: height)
    }
}
