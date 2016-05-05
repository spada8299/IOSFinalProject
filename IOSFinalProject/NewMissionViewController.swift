//
//  NewMissionViewController.swift
//  IOSFinalProject
//
//  Created by pingRuiLiao on 2016/5/4.
//  Copyright © 2016年 pingRuiLiao. All rights reserved.
//

import UIKit

class NewMissionViewController: UIViewController, MissionTabBarDelegate {

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
        case .profileViewController:
            let pvc = storyboard?.instantiateViewControllerWithIdentifier("profileViewController")
            self.navigationController?.popToRootViewControllerAnimated(true)
            self.navigationController?.pushViewController(pvc!, animated: true)
        default:
            break
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
