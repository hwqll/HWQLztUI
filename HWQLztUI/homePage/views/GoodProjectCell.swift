//
//  GoodProjectCell.swift
//  HWQLztUI
//
//  Created by hwq on 2018/2/9.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class GoodProjectCell: UITableViewCell {

    @IBOutlet weak var investBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        investBtn.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
