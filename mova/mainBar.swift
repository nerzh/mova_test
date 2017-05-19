//
//  mainBar.swift
//  mova
//
//  Created by Oleg Gudejchuk on 19.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//

import Foundation
import UIKit


class MainBar : UIView {
    
    init() {
        let f = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120)
        super.init(frame: f)
//        super.init(frame: CGRect.init())
        self.settingsApply()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainBar {
    fileprivate func settingsApply() {
        self.backgroundColor = UIColor.init(red: 0.286, green: 0.565, blue: 0.886, alpha: 1.00)
        
    }
}
