//
//  Constant.swift
//  HWQLztUI
//
//  Created by hwq on 2018/2/6.
//  Copyright © 2018年 hwq. All rights reserved.
//

import Foundation
import UIKit

let NaviBarColor = 0x2058f6
let TabbarColor = 0x2058f6
let HScreenHeight = UIScreen.main.bounds.size.height
let HScreenWidht = UIScreen.main.bounds.size.width

let iPhone40 = UIScreen.main.bounds.size.height == 568 ? true : false
let iPhone47 = UIScreen.main.bounds.size.height == 667 ? true : false
let iPhone55 = UIScreen.main.bounds.size.height == 736 ? true : false
let iPhone58 = UIScreen.main.bounds.size.height == 812 ? true : false

func ColorFromRGB(rgbValue : Int) -> UIColor {
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: 1.0)
    
}

func ColorFromHRGB(rgbValue : Int) -> UIColor {
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: 1.0)
    
}
