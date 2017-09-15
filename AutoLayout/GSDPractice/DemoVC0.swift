//
//  DemoVC0.swift
//  AutoLayout
//
//  Created by yuency on 15/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit


let kTimeInterval: TimeInterval = 0.8


class DemoVC0: ViewsViewController {
    
    
    var timer: Timer?
    
    
    var widthRatio: CGFloat = 0.4
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: kTimeInterval, target: self, selector: #selector(runAnimation), userInfo: nil, repeats: true)
        
        
        _ = view0.sd_layout().leftSpaceToView(view, 20)?.topSpaceToView(view, 80)?.heightIs(130)?.widthRatioToView(view, widthRatio)
        
        _ = view1.sd_layout().leftSpaceToView(view0, 10)?.topEqualToView(view0)?.heightIs(60)?.widthRatioToView(view0, 0.5)
        
        _ = view2.sd_layout().leftSpaceToView(view1, 10)?.topEqualToView(view1)?.heightRatioToView(view1, 1)?.widthIs(50)
        
        _ = view3.sd_layout().leftEqualToView(view1)?.topSpaceToView(view1, 10)?.heightRatioToView(view1, 1)?.widthRatioToView(view1, 1)
        
        _ = view4.sd_layout().leftEqualToView(view2)?.topEqualToView(view3)?.heightRatioToView(view3, 1)?.widthRatioToView(view2, 1)
        
        view0.addSubview(view5)
        _ = view5.sd_layout().centerYEqualToView(view0)?.rightSpaceToView(view0,10)?.widthRatioToView(view0, 0.5)?.heightIs(20)
    }
    
    
    @objc  private func runAnimation() {
        
        if widthRatio >= 0.4 {
            widthRatio = 0.1
        } else {
            widthRatio = 0.4
        }
        
        
        UIView.animate(withDuration: 0.8, animations: {
            
            _ = self.view0.sd_layout().widthRatioToView(self.view, self.widthRatio)
            
            // view0 和除了 View5之外的其他 View 有互相 参照, View0的约束发生了变化的时候,其他的 View 也会发生变化
            self.view0.updateLayout()
            // 这局刷新布局就是让父视图来刷新控件, 父视图只会刷新他的子视图, 而不会去刷新子视图的子视图, 所以这里需要 view5自己告诉父视图去刷新自己的位置
            self.view5.updateLayout()
            
        }, completion: nil)
        
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        ///释放定时器,否则会造成内存泄露
        timer?.invalidate()
        timer = nil
    }
    
}
