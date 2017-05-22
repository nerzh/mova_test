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
import RealmSwift

class Map : UIView {
    
    let widthInfoWindow   : CGFloat = 140
    let heightInfoWindow  : CGFloat = 50
    let iconView          = PinView.init()
    let selectedIcon      = PinView.init(active: true)
    var currentMarker     : GMSMarker!
    var camera            : GMSCameraPosition!
    var mapView           : GMSMapView!
    var marker            = GMSMarker()
    var realmData         : Results<PinsModel>!
    
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
        let realm = try! Realm()
        realmData = realm.objects(PinsModel.self)
        
        for pin in realmData {
            let marker              = GMSMarker()
            marker.userData         = pin
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
        let pinObject = (marker.userData as! PinsModel)
        let view      = InfoWindow.init(frame: CGRect.init(x: 0, y: 0, width: widthInfoWindow, height: heightInfoWindow), image: UIImage.init(named: pinObject.photo), topText: pinObject.titleText, bottomText: pinObject.bottomText)
        
        changePin(marker)
        
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








