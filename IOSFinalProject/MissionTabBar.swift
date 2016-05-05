//
//  MissionTabBar.swift
//  IOSFinalProject
//
//  Created by pingRuiLiao on 2016/5/4.
//  Copyright © 2016年 pingRuiLiao. All rights reserved.
//

import UIKit

enum BasicViewController {
    case mapViewController
    case profileViewController
    case newMissionViewController
}

protocol MissionTabBarDelegate {
    func presentBasicViewController( basicViewController: BasicViewController)
}

class MissionTabBar: UIView {
    
    var delegate: MissionTabBarDelegate?
    
    @IBOutlet var theView: MissionTabBar!
    @IBOutlet weak var profilePageButton: UIButton!
    @IBOutlet weak var newMissionButton: UIButton!
    @IBOutlet weak var allMissionButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        NSBundle.mainBundle().loadNibNamed("MissionTabBar", owner: self, options: nil)
        self.theView.frame = CGRectMake(0, 0, 320, 80)
        self.addSubview(theView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func newMissionButtonDidTapped(sender: AnyObject) {
        delegate?.presentBasicViewController(.newMissionViewController)
    }
    @IBAction func profilePageButtonDidTapped(sender: AnyObject) {
        delegate?.presentBasicViewController(.profileViewController)
    }
    @IBAction func allMissionButtonDidTapped(sender: AnyObject) {
        delegate?.presentBasicViewController(.mapViewController)
    }

}
