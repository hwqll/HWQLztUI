//
//  LeadPageContentViewController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/3/28.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class LeadPageContentViewController: UIViewController {
    
    @IBOutlet var contentImageView : UIImageView!
    
    var index  = 0
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentImageView.image = UIImage(named: self.imageName)
    }
    
    

}
