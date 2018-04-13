//
//  LeadPageViewController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/3/28.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

protocol LeadPageViewControllerDelegate : class {
    func didIsHideButton(currentIndex : Int)
}

class LeadPageViewController: UIPageViewController , UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    let pageImages = ["引导页1", "引导页2", "引导页3"]
    
     var currentIndex = 0
    
    weak var leadPageDelegate : LeadPageViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        //设置第一个内容控制器
        if let startController = contentViewContorller(at: 0) {
            self.setViewControllers([startController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    //返回子内容控制器
    func contentViewContorller(at index: Int) -> LeadPageContentViewController? {
        if index < 0 || index >= pageImages.count {
            return nil
        }
        
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let leadPageContentViewController = storyboard.instantiateViewController(withIdentifier: "LeadPageContentViewController") as? LeadPageContentViewController {
            leadPageContentViewController.imageName = pageImages[index]
            leadPageContentViewController.index = index
            
            return leadPageContentViewController
        }
        return nil
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! LeadPageContentViewController).index
        index += 1
        
        return contentViewContorller(at: index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! LeadPageContentViewController).index
        index -= 1
        
        return contentViewContorller(at: index)
    }
    //手势滑动后调用
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            let contentViewController = pageViewController.viewControllers?.first as! LeadPageContentViewController
            //获取当前视图索引
            self.currentIndex = contentViewController.index
            
            self.leadPageDelegate.didIsHideButton(currentIndex: currentIndex)
        }
    }
}
