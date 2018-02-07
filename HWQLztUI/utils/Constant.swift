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

func ColorFromRGB(rgbValue : Int) -> UIColor {
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: 1.0)
    
}