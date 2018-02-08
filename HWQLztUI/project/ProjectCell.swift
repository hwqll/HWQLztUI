//
//  ProjectCell.swift
//  HWQLztUI
//
//  Created by hwq on 2018/2/8.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class ProjectCell: UITableViewCell {

    @IBOutlet weak var projectType: UILabel!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var isAddRate: UIImageView!
   
    @IBOutlet weak var projectTimeLimit: UILabel!
    @IBOutlet weak var projectRate: UILabel!
    
    @IBOutlet weak var projectLeftMoney: UILabel!
    
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    
     override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
