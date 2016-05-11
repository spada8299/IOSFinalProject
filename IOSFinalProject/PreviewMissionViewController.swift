//
//  PreviewMissionViewController.swift
//  IOSFinalProject
//
//  Created by pingRuiLiao on 2016/5/4.
//  Copyright © 2016年 pingRuiLiao. All rights reserved.
//

import UIKit
import GoogleMaps

class PreviewMissionViewController: UIViewController, CLLocationManagerDelegate {
    
    
    let locationManager = CLLocationManager()
    var mission: Mission!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var missionContentLabel: UILabel!
    @IBOutlet weak var missionLocationLabel: UILabel!
    @IBOutlet weak var missionTimeLabel: UILabel!
    @IBOutlet weak var missionCreatorImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        missionContentLabel.text = mission.content
        missionLocationLabel.text = mission.locationName ?? ""
        missionTimeLabel.text = "\(mission.duration)分鐘後結束"
    }
    
    // MARK: CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        if status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            mission.locationCoordinate = location
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
        
    }

}
