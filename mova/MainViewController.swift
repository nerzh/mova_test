//
//  ViewController.swift
//  mova
//
//  Created by Oleg Gudejchuk on 19.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainBar     : MainBar!
    var listButtons : ListButton!
    var map         : Map!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeDesign()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: init design
extension MainViewController {
    fileprivate func makeDesign() {
        mainBar     = MainBar.init()
        listButtons = ListButton.init(frame: CGRect())
        map         = Map.init(frame: CGRect())
        
        self.view.addSubview(mainBar)
        self.view.addSubview(listButtons)
        self.view.addSubview(map)
        setConstraints()
        self.view.layoutIfNeeded()
        self.view.setNeedsLayout()
        map.initMap()
    }
    
    private func setConstraints() {
        mainBar.translatesAutoresizingMaskIntoConstraints     = false
        map.translatesAutoresizingMaskIntoConstraints         = false
        listButtons.translatesAutoresizingMaskIntoConstraints = false
        
        let initialConstraints = [
            mainBar.heightAnchor.constraint(equalToConstant: 120),
            mainBar.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            mainBar.topAnchor.constraint(equalTo: self.view.topAnchor),
            mainBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mainBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            listButtons.heightAnchor.constraint(equalToConstant: 50),
            listButtons.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            listButtons.topAnchor.constraint(equalTo: mainBar.bottomAnchor),
            listButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            listButtons.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),

            map.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            map.topAnchor.constraint(equalTo: listButtons.bottomAnchor),
            map.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            map.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            map.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(initialConstraints)
    }
}


