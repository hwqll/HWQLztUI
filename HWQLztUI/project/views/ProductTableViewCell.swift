//
//  ProductTableViewCell.swift
//  HWQLztUI
//
//  Created by hwq on 2018/3/16.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet var jxType : UILabel! {
        didSet {
            jxType.numberOfLines = 0
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
