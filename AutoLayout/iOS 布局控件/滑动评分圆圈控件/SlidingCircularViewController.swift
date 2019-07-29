//
//  SlidingCircularViewController.swift
//  AutoLayout
//
//  Created by EF on 2019/7/29.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit

class SlidingCircularViewController: UIViewController {
    
    @IBOutlet weak var goalView: YXGoalReviewView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionGoal(_ sender: YXGoalReviewView) {
        print("当前选中的值 \(sender.value)")
    }
    
    @IBAction func actionStepper(_ sender: UIStepper) {
        print("UIStepper - value: \(sender.value)")
        goalView.totalCount = Int(sender.value)
    }
    
    @IBAction func actionSetValue(_ sender: UIStepper) {
        print("UIStepper - value: \(sender.value)")
        goalView.value = Int(sender.value)
    }
    
}
