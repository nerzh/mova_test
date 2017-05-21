//
//  ListButtons.swift
//  mova
//
//  Created by Oleg Gudejchuk on 19.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//

import Foundation
import UIKit

class ListButton : UICollectionView {
    
    let font                      = UIFont.init(name: "Helvetica Neue", size: 15)
    let heightButton : CGFloat    = 40
    let buttonPadding : CGFloat   = 5
    var widthOfCollectionViewCell = [CGFloat]()
    let hardcodedArray            = [
        "word 1","word word 2", "word 3","word 4", "word word word 5","word 6", "word 7","word 8", "word 9", "word 10","word 11", "word word 12"
    ]
    
    init(frame: CGRect) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection                 = .horizontal
        layout.sectionInset                    = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 2)
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.delegate                       = self
        self.dataSource                     = self
        self.backgroundColor                = UIColor.white
        self.showsHorizontalScrollIndicator = false
        self.register(ListButtonCell.self, forCellWithReuseIdentifier: "listCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListButton : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hardcodedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as! ListButtonCell
        
        cell.label.text = hardcodedArray[indexPath.row]
        cell.label.sizeToFit()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        widthOfCollectionViewCell.append(hardcodedArray[indexPath.row].widthOfLabel(font: font!))
        
        return CGSize(width: widthOfCollectionViewCell.last! + buttonPadding*2, height: heightButton)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("TAP \(hardcodedArray[indexPath.row])")
    }
}

class ListButtonCell : UICollectionViewCell {
    
    let font  = UIFont.init(name: "Helvetica Neue", size: 15)
    var label : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingsApply()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ListButtonCell {
    fileprivate func settingsApply() {
        label = UILabel(frame: self.contentView.frame)
        label.font = font
        label.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(label)
        self.contentView.layer.borderColor  = UIColor.init(red:0.922, green:0.922, blue:0.922, alpha:1.00).cgColor
        self.contentView.layer.borderWidth  = 2
        self.contentView.layer.cornerRadius = 3
        setConstraints()
    }
    
    private func setConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let initialConstraints = [
            label.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(initialConstraints)
    }
}




