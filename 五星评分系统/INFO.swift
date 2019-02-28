//
//  INFO.swift
//  五星评分系统
//
//  Created by USER on 2019/02/27.
//  Copyright © 2019 ZZL. All rights reserved.
//

import Foundation

struct ItemInfo {
    var itemName :String?
    var imageName:String?
    var point:Int?
    
    init(itemName:String , imageName:String, point:Int) {
        self.itemName = itemName
        self.imageName = imageName
        self.point = point
    }
}
