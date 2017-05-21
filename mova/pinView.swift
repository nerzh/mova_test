//
//  pinView.swift
//  mova
//
//  Created by Oleg Gudejchuk on 21.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//

import Foundation
import UIKit


class PinView : UIView {
    
    let width    : CGFloat = 23
    let height   : CGFloat = 32
    let isActiv  : Bool
    var imagePin : UIImageView!
    
    init(active: Bool = false) {
        isActiv = active
        super.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height))
        settingsApply()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PinView {
    fileprivate func settingsApply() {
        imagePin = BarIco.init(image: UIImage.init(named: "imagePin"))
        self.addSubview(imagePin)
        setConstraints()
        
        if (isActiv) {
            let circle = UIView.init(frame: CGRect.init(x: self.frame.maxX - 10, y: 0, width: 10, height: 10))
            circle.layer.cornerRadius = 5
            circle.backgroundColor = UIColor.red
            self.addSubview(circle)
        }
    }
    
    private func setConstraints() {
        imagePin.translatesAutoresizingMaskIntoConstraints = false
        
        let initialConstraints = [
            imagePin.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imagePin.topAnchor.constraint(equalTo: self.topAnchor),
            imagePin.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imagePin.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ]
        
        NSLayoutConstraint.activate(initialConstraints)
        
        self.layoutIfNeeded()
        self.setNeedsLayout()
    }
}
