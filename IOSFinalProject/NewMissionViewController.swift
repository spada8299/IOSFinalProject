//
//  NewMissionViewController.swift
//  IOSFinalProject
//
//  Created by pingRuiLiao on 2016/5/4.
//  Copyright © 2016年 pingRuiLiao. All rights reserved.
//

import UIKit

class NewMissionViewController: UIViewController, MissionTabBarDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var newMission = Mission()
    
    @IBOutlet weak var missionCategoryPicker: UIPickerView!
    @IBOutlet weak var missionContentTextField: UITextField!
    
    @IBOutlet weak var missionEmergencySlider: UISlider!
    
    @IBOutlet weak var missionLocationNameTextField: UITextField!
    
    @IBOutlet weak var missionHelperNumberPicker: UIPickerView!
    
    let arrayOfMissionCategories = ["借東西", "搬東西", "填問券", "幫吃", "買一送一"]
    let arrayOfMissionHelperNumber = [1,2,3,4,5,6,7,8,9,10,15,20,25,30]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMissionTabBar()
        missionCategoryPicker.delegate = self
        missionHelperNumberPicker.delegate = self
        // for index in
        // Do any additional setup after loading the view.
    }

    
    func setupMissionTabBar() {
        let missionTabBar = MissionTabBar(frame: CGRectMake(0, 488, 320, 80))
        missionTabBar.delegate = self
        self.view.addSubview(missionTabBar)
    }
    
    // MARK: -MissionTabBarDelegate
    
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
    // MARK: - SliderView
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        if let slider = sender as? UISlider {
            newMission.duration = 120 - Int(slider.value)
            // 越緊急，時間越短
        }
    }
    // MARK: - PickerViewDelegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == missionCategoryPicker {
            return arrayOfMissionCategories.count
        } else if pickerView == missionHelperNumberPicker {
            return arrayOfMissionHelperNumber.count
        } else {
            return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == missionCategoryPicker {
            return arrayOfMissionCategories[row]
        } else if pickerView == missionHelperNumberPicker {
            return String(arrayOfMissionHelperNumber[row])
        } else {
            return nil
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == missionCategoryPicker {
            newMission.category = stringToEnum(arrayOfMissionCategories[row])
        } else if pickerView == missionHelperNumberPicker {
            newMission.helperNumber = arrayOfMissionHelperNumber[row]
        }
    }
    
    // Maybe i should use dictionary
    func stringToEnum(string: String) -> MissionCategory {
        switch string {
        case "借東西":
            return .borrowSomething
        case "搬東西":
            return .moveSomething
        case "填問券":
            return .questionaire
        case "幫吃":
            return .shareFood
        case "買一送一":
            return .starbucks
        default:
            return .other
        }
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "previewNewMission" {
            if let pmvc = segue.destinationViewController as? PreviewMissionViewController {
                newMission.content = self.missionContentTextField.text ?? ""
                newMission.locationName = self.missionLocationNameTextField.text
                pmvc.mission = newMission
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
    }

    

}
