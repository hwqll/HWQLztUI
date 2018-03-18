//
//  ProjectTableViewController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/2/6.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit
import MJRefresh

class ProjectTableViewController: UITableViewController {
    let ApearFooter = 6 //显示上拉刷新计划数量
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.createProjectTableView()
    }
    
    func createUI() {
         self.navigationItem.title = "投资"
    }
    
    func  createProjectTableView() {
       
        self.tableView.register( UINib(nibName: "ProjectCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 150
        //添加首尾刷新
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(self.loadData))
        self.tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(self.loadMoreData))
        self.tableView.mj_footer.isHidden = true;
    }
    @objc func loadData() {
        self.tableView.mj_header.endRefreshing()
        
    }
    @objc func loadMoreData() {
        self.tableView.mj_footer.endRefreshing()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let projectDetail = self.storyboard?.instantiateViewController(withIdentifier: String(describing: ProjectDetailViewController.self)) as! ProjectDetailViewController
        
       projectDetail.hidesBottomBarWhenPushed = true
        //self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(projectDetail, animated: true)
       // self.hidesBottomBarWhenPushed = false
       // tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
