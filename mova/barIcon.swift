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
    
    override init (image: UIImage?) {
        super.init(image: image)
        settingsApply()
        self.layoutIfNeeded()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BarIco {
    fileprivate func settingsApply() {
        self.contentMode = UIViewContentMode.scaleAspectFit
        self.frame = CGRect.init(x: 0, y: 0, width: 28, height: 28)
        self.target(forAction: #selector(t), withSender: self)
    }
    
    func t() {
        print("ddd")
    }
}
