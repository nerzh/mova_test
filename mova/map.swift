//
//  map.swift
//  mova
//
//  Created by Oleg Gudejchuk on 20.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

struct MapPin {
    var latitude   : CGFloat
    var longitude  : CGFloat
    var text       : String
    var bottomText : String
    
    init(_ latitude: CGFloat, _ longitude: CGFloat, _ text: String?, _ bottomText: String?) {
        self.latitude   = latitude
        self.longitude  = longitude
        self.text       = text ?? ""
        self.bottomText = bottomText ?? ""
    }
}

class Map : UIView {
    
    let widthInfoWindow   : CGFloat = 140
    let heightInfoWindow  : CGFloat = 50
    let iconView          = PinView.init()
    let selectedIcon      = PinView.init(active: true)
    var currentMarker     : GMSMarker!
    var camera            : GMSCameraPosition!
    var mapView           : GMSMapView!
    var marker            = GMSMarker()
    var tempHardCodedData = [MapPin]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingsApply()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Map {
    fileprivate func settingsApply() {
    }
    
    func initMap() {
        camera                      = GMSCameraPosition.camera(withLatitude: 50.43, longitude: 30.52, zoom: 13.0)
        mapView                     = GMSMapView.map(withFrame: self.bounds, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.delegate            = self
        self.addSubview(mapView)
        
        addFakeData()
    }
    
    fileprivate func addFakeData() {
        tempHardCodedData = [
            MapPin.init(50.41, 30.51, "Lorem Ipsum", "bottom"),
            MapPin.init(50.40, 30.50, "Lorem Ipsum 2", "bottom"),
            MapPin.init(50.39, 30.52, "Lorem Ipsum 3", "bottom")
        ]
        
        for pin in tempHardCodedData {
            let marker              = GMSMarker()
            marker.position         = CLLocationCoordinate2D(latitude: CLLocationDegrees(pin.latitude), longitude: CLLocationDegrees(pin.longitude))
            marker.map              = mapView
            marker.iconView         = iconView
            marker.infoWindowAnchor = CGPoint(x: -3.5, y: 1.2)
            mapView.selectedMarker  = marker
            mapView.camera          = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(pin.latitude), longitude: CLLocationDegrees(pin.longitude), zoom: 13)
        }
    }
}

extension Map : GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = InfoWindow.init(frame: CGRect.init(x: 0, y: 0, width: widthInfoWindow, height: heightInfoWindow), image: UIImage.init(named: "dataPin"), topText: "TOP Text", bottomText: "bottomText")
        
        changePin(marker)
        print("TAP Pin")
        
        return view
    }
    
    private func changePin(_ marker: GMSMarker) {
        if (currentMarker != nil) {
            currentMarker.iconView = iconView
            currentMarker          = marker
            currentMarker.iconView = selectedIcon
        } else {
            currentMarker          = marker
            currentMarker.iconView = selectedIcon
        }
    }
}








