//
//  infoWindow.swift
//  mova
//
//  Created by Oleg Gudejchuk on 21.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//

import Foundation
import UIKit

class InfoWindow : UIView {
    
    let leftImage      = UIView.init()
    let contentView    = UIView.init()
    let titleLabel     = UILabel.init()
    let ratingView     = UIView.init()
    let bottomLabel    = UILabel.init()
    let image          : BarIco
    let starsView      = BarIco.init(image: UIImage.init(named: "stars"))
    let titleText      : String
    let bottomText     : String
    let borderColor    = UIColor.init(red: 0.643, green: 0.624, blue: 0.612, alpha:1.00).cgColor
    let cornerLine     : CGFloat = 15
    let borderWidth    : CGFloat = 2
    let borderRadius   : CGFloat = 3
    var infoView       = UIView.init()
    let leftImageWidth : CGFloat = 40
    let font           = UIFont.init(name: "Helvetica Neue", size: 8)
    
    init(frame: CGRect, image: UIImage?, topText: String, bottomText: String) {
        self.image      = BarIco.init(image: image)
        self.titleText  = topText
        self.bottomText = bottomText
        super.init(frame: frame)
        settingsApply()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension InfoWindow {
    fileprivate func settingsApply() {
        let hypotenuse     = sqrt(Double(2*pow(Double(cornerLine), 2)))
        let heightOfCorner = CGFloat(sqrt(pow(Double(cornerLine), 2) - (pow(hypotenuse, 2)/4)))
        
        let tempInfoView   = UIView.init(frame: CGRect.init(x: self.frame.minX, y: self.frame.minY, width: self.frame.width - heightOfCorner, height: self.frame.height))
        infoView.frame     = CGRect.init(x: tempInfoView.frame.minX + borderWidth, y: tempInfoView.frame.minY + borderWidth, width: tempInfoView.frame.width - borderWidth*2, height: tempInfoView.frame.height - borderWidth*2)
        let cornerView     = UIView.init(frame: CGRect.init(x: tempInfoView.frame.maxX - cornerLine/2 - borderWidth, y: tempInfoView.frame.midY - cornerLine/2, width: cornerLine, height: cornerLine))
        
        tempInfoView.backgroundColor    = UIColor.white
        tempInfoView.layer.borderColor  = borderColor
        tempInfoView.layer.borderWidth  = borderWidth
        tempInfoView.layer.cornerRadius = borderRadius
        cornerView.backgroundColor      = UIColor.white
        cornerView.layer.borderColor    = borderColor
        cornerView.layer.borderWidth    = borderWidth
        cornerView.transform            = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        infoView.backgroundColor        = UIColor.white
        infoView.layer.cornerRadius     = borderRadius
        titleLabel.textAlignment        = .left
        titleLabel.text                 = titleText
        titleLabel.font                 = font
        titleLabel.textColor            = UIColor.init(red: 0.227, green: 0.576, blue: 0.886, alpha:1.00)
        bottomLabel.textAlignment       = .center
        bottomLabel.text                = bottomText
        bottomLabel.font                = font
        
        self.addSubview(tempInfoView)
        self.addSubview(cornerView)
        self.addSubview(infoView)
        
        makeContent()
        image.layer.cornerRadius  = image.frame.width / 2
        image.layer.masksToBounds = true
    }
    
    //  MARK: set content
    fileprivate func makeContent() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(ratingView)
        ratingView.addSubview(starsView)
        contentView.addSubview(bottomLabel)
        leftImage.addSubview(image)
        infoView.addSubview(leftImage)
        infoView.addSubview(contentView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        leftImage.translatesAutoresizingMaskIntoConstraints   = false
        image.translatesAutoresizingMaskIntoConstraints       = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints  = false
        ratingView.translatesAutoresizingMaskIntoConstraints  = false
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        starsView.translatesAutoresizingMaskIntoConstraints   = false
        
        let initialConstraints = [
            leftImage.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            leftImage.topAnchor.constraint(equalTo: infoView.topAnchor),
            leftImage.bottomAnchor.constraint(equalTo: infoView.bottomAnchor),
            leftImage.widthAnchor.constraint(equalToConstant: leftImageWidth),
            
            image.leadingAnchor.constraint(equalTo: leftImage.leadingAnchor, constant: 8),
            image.topAnchor.constraint(equalTo: leftImage.topAnchor, constant: 4),
            image.trailingAnchor.constraint(equalTo: leftImage.trailingAnchor, constant: -8),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: leftImage.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: infoView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 9),
            
            ratingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ratingView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            ratingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            starsView.leadingAnchor.constraint(equalTo: ratingView.leadingAnchor),
            starsView.topAnchor.constraint(equalTo: ratingView.topAnchor),
            starsView.heightAnchor.constraint(equalToConstant: 15),
            starsView.widthAnchor.constraint(equalToConstant: 60),
            
            bottomLabel.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 4),
            bottomLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            bottomLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomLabel.heightAnchor.constraint(equalToConstant: 10)
        ]
        
        NSLayoutConstraint.activate(initialConstraints)
        
        self.layoutIfNeeded()
        self.setNeedsLayout()
    }
}










