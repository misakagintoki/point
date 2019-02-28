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
    
    init(itemName:String , imageName:String) {
        self.itemName = itemName
        self.imageName = imageName
    }
}
