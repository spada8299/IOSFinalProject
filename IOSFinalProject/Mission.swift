//
//  Mission.swift
//  IOSFinalProject
//
//  Created by pingRuiLiao on 2016/5/5.
//  Copyright © 2016年 pingRuiLiao. All rights reserved.
//

import Foundation

enum MissionType {
    case borrowSomething
    case moveSomething
    case questionaire
    case shareFood
    case starbucks
}

struct Mission {
    let _id: String
    // name: String
    let content: String
    let creater: User
    let category: String
    //let location
    let createDate: NSDate
    let duration: Int
    var helperNumber: Int
    var helpers: [User]
    var finished: Bool
}