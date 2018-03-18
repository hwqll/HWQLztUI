//
//  InvestmentRecordTableViewController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/3/16.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit
import MJRefresh

class InvestmentRecordTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "投资记录"
        self.createTableView()
        self.tableViewHeaderRefresh()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createTableView() {
        self.tableView.rowHeight = 90
        self.tableView.estimatedRowHeight = 90
        
        
    }
    
    func tableViewHeaderRefresh() {
        
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(self.loadData))
    }
    
    @objc func loadData() {
        self.tableView.mj_header.endRefreshing()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseIdentifier = "cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! InvestmentRecordTableViewCell

        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
