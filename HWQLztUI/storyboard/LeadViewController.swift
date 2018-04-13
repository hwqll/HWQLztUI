//
//  LeadViewController.swift
//  HWQLztUI
//
//  Created by hwq on 2018/3/28.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class LeadViewController: UIViewController, LeadPageViewControllerDelegate {
    
    @IBOutlet var startButton : UIButton! {
        didSet {
            startButton.layer.cornerRadius = 15.0
            startButton.layer.masksToBounds = true
            startButton.isHidden = true
        }
    }
    
    var leadPageViewController : LeadPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    func updateUI() {
        let index = leadPageViewController.currentIndex
        switch index {
        case 0...1:
            startButton.isHidden = true
        case 2:
            startButton.isHidden = false
        default:
            break
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as? LeadPageViewController
        if let des = destination {
            leadPageViewController = des
            leadPageViewController.leadPageDelegate = self
        }
    }
    
    @IBAction func startButtonTapped(sender : UIButton) {
        UserDefaults.standard.set(true, forKey: "hasViewedLeadPage")
        
        dismiss(animated: true, completion: nil)
    }
    
    func didIsHideButton(currentIndex: Int) {
        updateUI()
    }
}
