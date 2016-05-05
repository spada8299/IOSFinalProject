//
//  User.swift
//  IOSFinalProject
//
//  Created by pingRuiLiao on 2016/5/5.
//  Copyright © 2016年 pingRuiLiao. All rights reserved.
//

import Foundation
//import GoogleMaps
enum Gender {
    case male
    case female
}

struct User {
    let _id: String
    var name: String
    var email: String
    var password: String
    var points: Int
    var missionFinished: [String]
    var missionCreated: [String]
    var missionNow: String
//    var location:

}