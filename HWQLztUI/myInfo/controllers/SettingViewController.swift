//
//  SettingViewController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/3/16.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideBackBarButtonTitle()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func hideBackBarButtonTitle()  {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }

}
