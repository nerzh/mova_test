//
//  GeneralExtension.swift
//  mova
//
//  Created by Oleg Gudejchuk on 20.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func widthOfLabel(font: UIFont) -> CGFloat {
        let testLabel  = UILabel()
        testLabel.text = self
        testLabel.font = font
        testLabel.sizeToFit()
        
        return testLabel.frame.width
    }
}
