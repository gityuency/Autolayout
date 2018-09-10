//
//  iOS10AnimationViewController.swift
//  AutoLayout
//
//  Created by 去年的那个夏天 on 2018/9/10.
//  Copyright © 2018年 yuency. All rights reserved.
//

import UIKit


/// iOS 10 UIViewPropertyAnimator
/*
 1 可中断性
 2 可以擦除
 3 可反转
 4 丰富的动画时间控制功能
 5 动态
 */

@available(iOS 10.0, *) //如果可以使用 iOS 10

class iOS10AnimationViewController: UIViewController {
    
    var v: UIView!
    
    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化View
        let v = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        v.backgroundColor = UIColor.red
        // 添加View并使用属性记录
        view.addSubview(v)
        self.v = v
        
        // 初始化一个属性动画器
        let animator = UIViewPropertyAnimator(duration: 4, curve: UIViewAnimationCurve.linear) {
            v.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
        }
        self.animator = animator
        
    }
    
    @IBAction func startAnim(_ sender: Any) {
        animator.startAnimation()
    }
    
    @IBAction func pauseAnim(_ sender: Any) {
        animator.pauseAnimation()
    }
    
    @IBAction func continueAnim(_ sender: Any) {
        // 参数：dampingRatio 阻尼系数 0 - 1 .阻尼系数越小，弹性度越大
        let param = UISpringTimingParameters(dampingRatio: 0.1)
        animator.continueAnimation(withTimingParameters: param, durationFactor: 1)
    }
    
    @IBAction func stopAnim(_ sender: Any) {
        // 参数代表：是否要在动画执行完毕之后再停止动画
        animator.stopAnimation(false)
    }
    
}
