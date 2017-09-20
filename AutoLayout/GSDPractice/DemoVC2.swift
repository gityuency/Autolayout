//
//  DemoVC2.swift
//  AutoLayout
//
//  Created by yuency on 15/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class DemoVC2: ViewsViewController {
    
    let centerButton = UIButton()
    
    let autoWidthViewsContainer = UIView()
    
    let autoMarginViewsContainer = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        
        //设置自定义图片和 Label 位置的 Button
        setupCustomButton()
        
             
        
    }
    
    
    //设置自定义图片和 Label 位置的 Button
    func setupCustomButton() {
        
        centerButton.backgroundColor = UIColor.orange
        centerButton.setTitle("自定义 Button", for: .normal)
        centerButton .setImage( UIImage(named: "7.jpg"), for: .normal)
        centerButton.titleLabel?.backgroundColor = UIColor.lightGray
        centerButton.titleLabel?.textAlignment = .center
        centerButton.imageView?.contentMode = .scaleAspectFit
        centerButton.imageView?.backgroundColor = UIColor.yellow //imageView 的背景色设置成为黄色
        view.addSubview(centerButton)
        
        
        //按钮的布局
        _ = centerButton.sd_layout().centerXEqualToView(view)?.topSpaceToView(view, 10)?.widthRatioToView(view, 0.5)?.heightIs(120)
        
        //按钮图片的约束
        _ = centerButton.imageView?.sd_layout().widthRatioToView(centerButton, 0.8)?.topSpaceToView(centerButton,10)?.centerXEqualToView(centerButton)?.heightRatioToView(centerButton, 0.6)
        
        //按钮 Label 的约束
        _ = centerButton.titleLabel?.sd_layout().topSpaceToView(centerButton.imageView, 10)?.leftEqualToView(centerButton.imageView)?.rightEqualToView(centerButton.imageView)?.bottomSpaceToView(centerButton, 10)
    }
    
    
    
    
    
    
}
