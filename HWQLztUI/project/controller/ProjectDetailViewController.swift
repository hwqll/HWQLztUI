//
//  ProjectDetailViewController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/3/16.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class ProjectDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: - property
    
    @IBOutlet weak var investBottomConstraint: NSLayoutConstraint!{
        didSet {
            if iPhone58 {
                investBottomConstraint.constant += 34
            }
        }
    }
    
    @IBOutlet var tableView : UITableView!
    
    @IBOutlet var investButton : UIButton! {
        didSet {
            investButton.layer.cornerRadius = 5
        }
    }
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "20180802-新手宝"
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.tableView.separatorStyle = .none
        
        self.automaticallyAdjustsScrollViewInsets = false
      //  self.hidesBottomBarWhenPushed = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - ACTION
    @IBAction func buyButtonClicked(sender : UIButton) {
        
        let invest = self.storyboard?.instantiateViewController(withIdentifier:String(describing: InvestViewController.self)) as! InvestViewController
        
        self.navigationController?.pushViewController(invest, animated: true)
    }
    //MARK: - table view delegate
    func numberOfSections(in tableView: UITableView) -> Int {
         return 3
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 3
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier:String(describing: HeaderTableViewCell.self), for: indexPath) as! HeaderTableViewCell
            cell.selectionStyle = .none
            return cell
        case 1:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier:String(describing: ProductTableViewCell.self), for: indexPath) as! ProductTableViewCell
                cell.jxType.text = "计息方式：丰就是快乐的肌肤快速减肥"
                cell.selectionStyle = .none
                return cell
            }else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier:String(describing: ProductTableViewCell.self), for: indexPath) as! ProductTableViewCell
                cell.jxType.text = "计息方式：丰就是快乐的肌肤快速减肥开始就开发建设科"
                cell.selectionStyle = .none
                return cell
            }else  {
                let cell = tableView.dequeueReusableCell(withIdentifier:String(describing: ProductTableViewCell.self), for: indexPath) as! ProductTableViewCell
                cell.jxType.text = "计息方式：丰就是快乐的肌肤"
                cell.selectionStyle = .none
                return cell
            }
        case 2:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier:String(describing: BottomTableViewCell.self), for: indexPath)  as! BottomTableViewCell
                cell.titleLabel.text = "项目详情"
                cell.selectionStyle = .none
                return cell
            }else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier:String(describing: BottomTableViewCell.self), for: indexPath) as! BottomTableViewCell
                cell.titleLabel.text = "相关资料"
                cell.selectionStyle = .none
                return cell
            }else  {
                let cell = tableView.dequeueReusableCell(withIdentifier:String(describing: BottomTableViewCell.self), for: indexPath) as!BottomTableViewCell
               cell.titleLabel.text = "投资记录"
                cell.selectionStyle = .none
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.section {
//        case 0:
//            return 90
//        default:
//            return 90
//        }
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: HScreenWidht, height: 50))
            view.backgroundColor = ColorFromRGB(rgbValue: 0xfafafa)
            let titleLabel = UILabel(frame: CGRect(x: 10, y: 5, width: HScreenWidht, height: 40))
            titleLabel.text = "产品介绍"
            titleLabel.textColor = UIColor.darkGray
            titleLabel.font = UIFont(name: "PingFang SC", size: 15.0)
            view.addSubview(titleLabel)
            
            return view
        }else {
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 50
        }else if section == 2{
            return 20
        }else {
            return 0
        }
    }
    

}
