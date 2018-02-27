//
//  MyInfoViewController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/2/6.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit
import MJRefresh

class MyInfoViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createUI()
        self.scrollViewHeaderRefresh()

    }
    func createUI(){
        self.automaticallyAdjustsScrollViewInsets = false
        //ios 11.0系统以上需要向上偏移20点
        if #available(iOS 11.0, *), iPhone58 {
            self.scrollView.contentInset = UIEdgeInsets(top: -44, left: 0, bottom: 0, right: 0)
        }else if #available(iOS 11.0, *) {
            self.scrollView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollViewHeaderRefresh() {
        self.scrollView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(self.loadData))
    }
    @objc func loadData() {
        self.scrollView.mj_header.endRefreshing()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated);
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
