//
//  Mission.swift
//  IOSFinalProject
//
//  Created by pingRuiLiao on 2016/5/5.
//  Copyright © 2016年 pingRuiLiao. All rights reserved.
//



import Foundation



enum MissionCategory {
    case borrowSomething// = "借東西"
    case moveSomething// = "搬東西"
    case questionaire// = "填問券"
    case shareFood// = "幫吃"
    case starbucks// = "買一送一"
    case other
    func allValues() -> [String] {
        return ["借東西", "搬東西", "填問券", "幫吃", "買一送一"]
    }
    func simpleDescription() -> String {
        switch self {
        case .borrowSomething:
            return "借東西"
        case .moveSomething:
            return "搬東西"
        case .questionaire:
            return "填問券"
        case .shareFood:
            return "幫吃"
        case .starbucks:
            return "買一送一"
        default:
            return "其他"
        }
    }
    
}



struct Mission {
//    let _id: String?
    // name: String
    var content: String
//    let creater: User
    var category: MissionCategory
    var locationName: String?
    var locationCoordinate: CLLocation?
//    let createDate: NSDate
    var duration: Int
    var helperNumber: Int
//    var helpers: [User]
    var finished: Bool
    init( content: String, category: MissionCategory, duration: Int, helperNumber: Int) {
        self.content = content
        self.category = category
        self.duration = duration
        self.helperNumber = helperNumber
        self.locationName = nil
        self.locationCoordinate = nil
        self.finished = false
    }
    init() {
        self.content = ""
        self.category = .borrowSomething
        self.duration = 1
        self.helperNumber = 1
        self.locationName = nil
        self.locationCoordinate = nil
        self.finished = false
        
    }
}