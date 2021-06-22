//
//  CornerViewController.swift
//  AutoLayout
//
//  Created by yuency on 2018/9/13.
//  Copyright © 2018年 yuency. All rights reserved.
//

import UIKit

/// 画圆角 指定圆角 指定位置圆角 部分圆角
class CornerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //先弄个 View
        let v = UIView(randomColorDark: true)
        v.frame = CGRect(x: 100, y: 100, width: 150, height: 150)
        view.addSubview(v)
        //画圆角
        let path = UIBezierPath(roundedRect: v.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 60, height: 60))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        v.layer.mask = shape;
        
        
        //iOS 11 新特性圆角
        let newView = UIView(randomColorDark: true)
        newView.frame = CGRect(x: 100, y: v.frame.maxY + 20, width: 150, height: 150)
        newView.layer.cornerRadius = 60;
        if #available(iOS 11.0, *) {
            newView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
        view.addSubview(newView)
        
    }

}
