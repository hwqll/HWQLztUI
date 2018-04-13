//
//  CustomNavigationController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/2/6.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bar = UINavigationBar.appearance()
        
        bar.barTintColor = UIColor(red: 3/255.0, green: 60/255.0, blue: 255/255.0, alpha: 1)
        bar.isTranslucent = false
       // self.navigationBar.barTintColor =  ColorFromRGB(rgbValue: NaviBarColor)//设置导航栏前景色
        self.navigationBar.tintColor = UIColor.white //item字体颜色
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white, NSAttributedStringKey.font: UIFont(name:"PingFang SC", size:19.0)! ]
        //自定义返回按钮图片
        let backImage = UIImage(named: "ico_back")
        self.navigationBar.backIndicatorImage = backImage
        self.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
