//
//  MyInfoViewController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/2/6.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class MyInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "我的"
        
        let localImages = ["cycle1", "cycle2", "cycle3","cycle4"]
       
        
        let cycleView = WRCycleScrollView(frame: CGRect(x: 0, y: 100, width: HScreenWidht, height: 300))
        cycleView.localImgArray = localImages
        cycleView.imgsType = .LOCAL
        cycleView.pageControlAliment = .CenterBottom
        self.view.addSubview(cycleView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
