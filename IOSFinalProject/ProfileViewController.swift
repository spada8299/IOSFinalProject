//
//  ProfileViewController.swift
//  
//
//  Created by pingRuiLiao on 2016/5/4.
//
//

import UIKit

class ProfileViewController: UIViewController, MissionTabBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMissionTabBar()
        // Do any additional setup after loading the view.
    }

    func setupMissionTabBar() {
        let missionTabBar = MissionTabBar(frame: CGRectMake(0, 488, 320, 80))
        missionTabBar.delegate = self
        self.view.addSubview(missionTabBar)
    }
    func presentBasicViewController(basicViewController: BasicViewController) {
        switch basicViewController {
        case .mapViewController:
            self.navigationController?.popToRootViewControllerAnimated(true)
        case .newMissionViewController:
            let nmvc = storyboard?.instantiateViewControllerWithIdentifier("newMissionViewController")
            self.navigationController?.popToRootViewControllerAnimated(true)
            self.navigationController?.pushViewController(nmvc!, animated: true)
        default:
            break
        }
    }



}
