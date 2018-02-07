//
//  HomePageViewController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/2/6.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.hidesBottomBarWhenPushed = false;
        //解决子控制器手势返回时顶部出现黑底问题。
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func push(_ sender: Any) {
        let v = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
       // let segue = UIStoryboardSegue(identifier: "push", source: self, destination: v!)
       // self.navigationControlle
        //解决子控制器手势返回标签控制器主界面时，标签栏提前显示。不美观。
        v!.hidesBottomBarWhenPushed = true;
        self.navigationController?.pushViewController(v!, animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
}
