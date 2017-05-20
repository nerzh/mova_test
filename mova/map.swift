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

class Map : UIView {
    
    var camera  : GMSCameraPosition!
    var mapView : GMSMapView!
    var marker  : GMSMarker!
    
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
        camera  = GMSCameraPosition.camera(withLatitude: 55.75, longitude: 37.62, zoom: 13.0)
        mapView = GMSMapView.map(withFrame: self.bounds, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        self.addSubview(mapView)
    }
}

extension Map : GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        return UIView()
    }
}
