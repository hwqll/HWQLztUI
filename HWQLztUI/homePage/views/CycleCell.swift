//
//  CycleCell.swift
//  HWQLztUI
//
//  Created by hwq on 2018/2/9.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class CycleCell: UITableViewCell {

  //  @IBOutlet weak var cycleScrollView: WRCycleScrollView!
    
//    @IBOutlet weak var cycleScrollView: UIView!
    @IBOutlet weak var textScrollView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //cycleScrollView.delegate = self
//        let localImages = ["cycle1", "cycle2", "cycle3","cycle4"]
////        let descs = ["韩国防部回应停止部署萨德:遵照最高统帅指导方针",
////                     "勒索病毒攻击再次爆发 国内校园网大面积感染",
////                     "Win10秋季更新重磅功能：跟安卓与iOS无缝连接",
////                     "《琅琊榜2》为何没有胡歌？胡歌：我看过剧本，离开是种保护",
////                    ]
////        let serverImages = ["http://p.lrlz.com/data/upload/mobile/special/s252/s252_05471521705899113.png",
////                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007678060723.png",
////                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007587372591.png",
////                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007388249407.png",
////                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007470310935.png"]
//        
//        let cycleView = WRCycleScrollView(frame: cycleScrollView.frame)
//        cycleView.localImgArray = localImages
//        cycleView.imgsType = .LOCAL
//        cycleView.pageControlAliment = .CenterBottom
//      //  self.contentView.addSubview(cycleView)
        
//        cycleScrollView.descTextArray = descs
//        cycleScrollView.descLabelHeight = 40
//        cycleScrollView.descLabelFont = UIFont.systemFont(ofSize: 13)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
