//
//  barItem.swift
//  mova
//
//  Created by Oleg Gudejchuk on 19.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//

import Foundation
import UIKit

class BarItem : UIView {
    let label  = UILabel.init()
    let button = UIButton.init()
    let font   = UIFont.init(name: "Helvetica Neue", size: 15)
    let ico    = BarIco.init(image: nil, width: 28, height: 28)
    var action   : ((Any)->())?
    
    init(labelText: String = "", image: UIImage?, handler: ((Any)->())? = nil) {
        super.init(frame: CGRect.init())
        settingsApply(labelText, image: image, handler: handler)
        self.layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BarItem {
    fileprivate func settingsApply(_ text: String, image: UIImage?, handler: ((Any)->())?) {
        ico.image            = image
        label.text           = text
        label.font           = font
        label.textColor      = UIColor.white
        label.textAlignment  = NSTextAlignment.center
        if let handler = handler {
            action = handler
            button.addTarget(self, action: #selector(tapButton(sender:)), for: UIControlEvents.touchUpInside)
        }
        
        self.addSubview(button)
        button.addSubview(ico)
        button.addSubview(label)
        
        setConstraints()
        self.layoutIfNeeded()
    }
    
    private func setConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints  = false
        ico.translatesAutoresizingMaskIntoConstraints    = false
        
        let initialConstraints = [
            button.widthAnchor.constraint(equalTo: self.widthAnchor),
            button.heightAnchor.constraint(equalTo: self.heightAnchor),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            label.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -5),
            label.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -12),
            label.topAnchor.constraint(equalTo: ico.bottomAnchor, constant: 5),
            label.heightAnchor.constraint(equalToConstant: 30),
            
            ico.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 18),
            ico.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -18),
            ico.topAnchor.constraint(equalTo: button.topAnchor, constant: 25)
        ]
        
        NSLayoutConstraint.activate(initialConstraints)
    }
}

extension BarItem {
    @objc fileprivate func tapButton(sender: Any) {
        action!(sender: sender)
    }
}
