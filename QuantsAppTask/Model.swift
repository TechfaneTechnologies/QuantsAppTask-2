//
//  Model.swift
//  QuantsAppTask
//
//  Created by avula koti on 11/02/20.
//  Copyright © 2020 avula koti. All rights reserved.
//

import Foundation

struct Feeds {
    
    let status:String??
    let timeStamp:String??
    let image:String??
    let name:String??
    let profilepic:String??
    let url:String??
    
    init(json: JSON) {
        status = json["status"].stringValue
        timeStamp = json["timeStamp"].stringValue
        image = json["image"].stringValue
        name = json["name"].stringValue
        profilepic = json["profilePic"].stringValue
        url = json["url"].stringValue
        
    }
}
