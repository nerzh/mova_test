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
    
    let widthBar     : CGFloat = UIScreen.main.bounds.width
    let heightBar    : CGFloat = 120
    let leftText               = "Filter"
    let rightText              = "List"
    let leftImage              = "options"
    let rightImage             = "message"
    
    var searchField  : SearchField!
    var barItemLeft  : BarItem!
    var barItemRight : BarItem!
    var actionLeft   : ((Any)->())!
    var actionRight  : ((Any)->())!
    
    init() {
        super.init(frame: CGRect.init(x: 0, y: 0, width: widthBar, height: heightBar))
        settingsApply()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainBar {
    
    fileprivate func settingsApply() {
        setActions()
        searchField = SearchField.init()
        barItemLeft  = BarItem.init(labelText: leftText, image: UIImage.init(named: leftImage), handler: actionLeft)
        barItemRight = BarItem.init(labelText: rightText, image: UIImage.init(named: rightImage), handler: actionRight)
        
        self.backgroundColor = UIColor.init(red: 0.286, green: 0.565, blue: 0.886, alpha: 1.00)
        
        self.addSubview(searchField)
        self.addSubview(barItemLeft)
        self.addSubview(barItemRight)
        
        setConstraints()
        self.layoutIfNeeded()
        self.setNeedsLayout()
    }
    
    private func setConstraints() {
        barItemLeft.translatesAutoresizingMaskIntoConstraints  = false
        barItemRight.translatesAutoresizingMaskIntoConstraints = false
        searchField.translatesAutoresizingMaskIntoConstraints  = false
        
        let initialConstraints = [
            barItemLeft.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            barItemLeft.topAnchor.constraint(equalTo: self.topAnchor),
            barItemLeft.trailingAnchor.constraint(equalTo: searchField.leadingAnchor),
            barItemLeft.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            barItemLeft.widthAnchor.constraint(equalToConstant: 65),
            
            barItemRight.leadingAnchor.constraint(equalTo: searchField.trailingAnchor),
            barItemRight.topAnchor.constraint(equalTo: self.topAnchor),
            barItemRight.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            barItemRight.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            barItemRight.widthAnchor.constraint(equalToConstant: 65),
            
            searchField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            searchField.topAnchor.constraint(equalTo: self.topAnchor, constant: 80)
        ]
        
        NSLayoutConstraint.activate(initialConstraints)
    }
    
//    MARK: Actions
    fileprivate func setActions() {
        actionLeft  = { sender in print("TAP LEFT") }
        actionRight = { sender in print("TAP RIGHT") }
    }
}






