//
//  ViewController.swift
//  mova
//
//  Created by Oleg Gudejchuk on 19.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainBar = MainBar.init()

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
        self.view.addSubview(self.mainBar)
        
        
//        let barFrame = CGRect.init(x: 0, y: 20, width: self.view.frame.width, height: 44)
//        
//        let navBar = UINavigationBar.init(frame: barFrame)
//        self.view.addSubview(navBar)
//        
//        let searchBar = UISearchBar.init(frame: barFrame)
//        searchBar.backgroundColor = UIColor.blue
//        
//        print(searchBar.subviews)
//        
//        
//        let view = UIView.init(frame: CGRect.init(x: 50, y: 50, width: 50, height: 50))
//        view.backgroundColor = UIColor.blue
//        
//        self.view.addSubview(view)
//        self.view.addSubview(searchBar)
    }
}

