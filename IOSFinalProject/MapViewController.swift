//
//  MapViewController.swift
//  IOSFinalProject
//
//  Created by pingRuiLiao on 2016/5/4.
//  Copyright © 2016年 pingRuiLiao. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, MissionTabBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMissionTabBar()
        
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

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

}
