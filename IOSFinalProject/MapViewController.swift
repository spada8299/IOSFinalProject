//
//  MapViewController.swift
//  IOSFinalProject
//
//  Created by pingRuiLiao on 2016/5/4.
//  Copyright © 2016年 pingRuiLiao. All rights reserved.
//
import GoogleMaps
import UIKit

class MapViewController: UIViewController, MissionTabBarDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMissionTabBar()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        //print(missionTabBar.frame)
    }
    func setupMissionTabBar() {
        let missionTabBar = MissionTabBar(frame: CGRectMake(0, 488, 320, 80))
        missionTabBar.delegate = self
        self.view.addSubview(missionTabBar)
    }
    func presentBasicViewController(basicViewController: BasicViewController) {
        switch basicViewController {
        case .newMissionViewController:
            let nmvc = storyboard?.instantiateViewControllerWithIdentifier("newMissionViewController")
            self.navigationController?.pushViewController(nmvc!, animated: true)
        case .profileViewController:
            let pvc = storyboard?.instantiateViewControllerWithIdentifier("profileViewController")
            self.navigationController?.pushViewController(pvc!, animated: true)
        default:
            break
        }
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
            
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
        
    }
 
}
