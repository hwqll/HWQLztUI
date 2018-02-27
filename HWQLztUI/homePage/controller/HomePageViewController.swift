//
//  HomePageViewController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/2/6.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //  UIApplication.shared.statusBarStyle = .lightContent
        self.createTableView()
        
    }
    func createTableView(){
        //不同的系统版本，设置单元格在最顶部，不在状态栏下方。
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never;
        } else {
            self.automaticallyAdjustsScrollViewInsets = false;
        }
        //self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
        self.tableView.register(UINib(nibName: "CycleCell", bundle: nil), forCellReuseIdentifier: "cyclecell")
        self.tableView.register(UINib(nibName: "GoodProjectCell", bundle: nil), forCellReuseIdentifier: "goodprojectcell")
        self.tableView.register(UINib(nibName: "ProjectCell", bundle: nil), forCellReuseIdentifier: "projectcell")
        self.tableView.register(UINib(nibName:"BottomCell", bundle: nil), forCellReuseIdentifier: "bottomcell")
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
    //mark: - uitableviewdelegate
    func numberOfSections(in tableView: UITableView) -> Int {
         return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 1
        }else if section == 2{
            return 2
        }
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cyclecell", for: indexPath) as! CycleCell
            cell.selectionStyle = .none
            let localImages = ["cycle1", "cycle2", "cycle3","cycle4"]
            
           // let cycleView = WRCycleScrollView(frame: cycleScrollView.frame)
            cell.cycleScrollView.localImgArray = localImages
            cell.cycleScrollView.imgsType = .LOCAL
            cell.cycleScrollView.pageControlAliment = .CenterBottom
            //  self.contentView.addSubview(cycleView)
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "goodprojectcell", for: indexPath) as! GoodProjectCell
            cell.selectionStyle = .none
            return cell
            
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "projectcell", for: indexPath)
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "bottomcell", for: indexPath)
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }
    
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            //return 200
            return 220
          //  return HScreenWidht * 0.55
        }else if indexPath.section == 1{
            return HScreenHeight * 0.26
        }else if indexPath.section == 2{
            return 150
        }else if indexPath.section == 3 {
            return 150
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2 {
            let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: HScreenWidht, height: 45))
            backgroundView.backgroundColor = ColorFromRGB(rgbValue: 0xe2e2e2)
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: HScreenWidht, height: 44))
            view.backgroundColor = UIColor.white
            let label = UILabel(frame: CGRect(x: 10, y: 4, width: HScreenWidht, height: 36))
            label.textColor = UIColor.darkGray
            label.text = "理财精选"
            label.font = UIFont(name: "PingFang SC", size: 15)
            view.addSubview(label)
            backgroundView.addSubview(view)
            
            return backgroundView
        }else {
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 45
        }else {
            return 0
        }
    }
}
