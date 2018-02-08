//
//  CustomTabbarController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/2/6.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class CustomTabbarController: UITabBarController {
    
    var homePage : HomePageViewController!
    var project : ProjectTableViewController!
    var foudation : FoundationViewController!
    var myinfo : MyInfoViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupSubViews()
        
    }

    func setupSubViews() {
        var s = UIStoryboard(name: "HomePage", bundle: nil)
        
        homePage = s.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
        homePage.tabBarItem.tag = 0
        homePage.tabBarItem = UITabBarItem(title: "首页", image: UIImage(named:"首页"), selectedImage: self.originalImageName(image: "首页2"))
        //设置字体颜色
        homePage.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : ColorFromRGB(rgbValue: TabbarColor)], for: .selected)
        let homePageNaviController = CustomNavigationController(rootViewController: homePage)
        
        s = UIStoryboard(name: "Project", bundle: nil)
        project = s.instantiateViewController(withIdentifier: "ProjectTableViewController") as! ProjectTableViewController
        project.tabBarItem.tag = 1
        project.tabBarItem = UITabBarItem(title: "投资", image: UIImage(named:"投资"), selectedImage: self.originalImageName(image: "投资2"))
        project.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : ColorFromRGB(rgbValue: TabbarColor)], for: .selected)
        let projectNaviController = CustomNavigationController(rootViewController: project)
        
        s = UIStoryboard(name: "Foundation", bundle: nil)
        foudation = s.instantiateViewController(withIdentifier: "FoundationViewController") as! FoundationViewController
        foudation.tabBarItem.tag = 1
        foudation.tabBarItem = UITabBarItem(title: "发现", image: UIImage(named:"发现"), selectedImage:self.originalImageName(image: "发现2"))
        foudation.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : ColorFromRGB(rgbValue: TabbarColor)], for: .selected)
        let foundationNaviController = CustomNavigationController(rootViewController: foudation)
        
        s = UIStoryboard(name: "MyInfo", bundle: nil)
        myinfo = s.instantiateViewController(withIdentifier: "MyInfoViewController") as! MyInfoViewController
        myinfo.tabBarItem.tag = 1
        myinfo.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named:"个人中心"), selectedImage:self.originalImageName(image: "个人中心2"))
        myinfo.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : ColorFromRGB(rgbValue: TabbarColor)], for: .selected)
        let myinfoNaviController = CustomNavigationController(rootViewController:  myinfo)
        
        self.viewControllers = [homePageNaviController, projectNaviController, foundationNaviController, myinfoNaviController]
        
        
    }
    /*设置tabbaritem可以保持图片自身颜色**/
    func originalImageName(image: String) -> UIImage {
        let img = UIImage(named:image)
        return img!.withRenderingMode(.alwaysOriginal) //设置渲染模式为自身
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 1:
            project.navigationItem.title = "投资"
        case 2:
            foudation.navigationItem.title = "发现"
        case 3:
            myinfo.navigationItem.title = "我的"
        default:
            print("")
        }
    }

}
