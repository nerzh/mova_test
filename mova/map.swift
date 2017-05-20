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
    var latitude  : CGFloat
    var longitude : CGFloat
    var text      : String
    
    init(_ latitude: CGFloat, _ longitude: CGFloat, _ text: String?) {
        self.latitude  = latitude
        self.longitude = longitude
        self.text      = text ?? ""
    }
}

class Map : UIView {
    
    var camera  : GMSCameraPosition!
    var mapView : GMSMapView!
    var marker  : GMSMarker!
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
        camera  = GMSCameraPosition.camera(withLatitude: 50.43, longitude: 30.52, zoom: 13.0)
        mapView = GMSMapView.map(withFrame: self.bounds, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        self.addSubview(mapView)
        
        addFakeData()
    }
    
    fileprivate func addFakeData() {
        tempHardCodedData = [
            MapPin.init(50.41, 30.51, "Lorem Ipsum"),
            MapPin.init(50.40, 30.50, "Lorem Ipsum 2"),
            MapPin.init(50.39, 30.52, "Lorem Ipsum 3")
        ]
        
        for pin in tempHardCodedData {
            let marker      = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(pin.latitude), longitude: CLLocationDegrees(pin.longitude))
//            marker.appearAnimation = GMSMarkerAnimation.
            marker.map = mapView
            mapView.selectedMarker = marker
            mapView.camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(pin.latitude), longitude: CLLocationDegrees(pin.longitude), zoom: 13)
        }
    }
}

extension Map : GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let m = UIView.init(frame: CGRect.init(x: 10, y: 30, width: 50, height: 50))
        m.backgroundColor = UIColor.brown
        
        return m
    }
}
