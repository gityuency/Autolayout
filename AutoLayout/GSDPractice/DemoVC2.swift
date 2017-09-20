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
        
        
        //设置一排固定间距自动宽度的子 View
        setupAutoWidthViewsWith(count: 4, margin: 10)
        
        
        //设置一排固定宽度自动间距子 View
        setupAutoMarginViewsWith(count: 4, itemWidth: 100)
        
        //设置3个水平等宽子view
        setUpEqualWidthView()
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
    
    
    
    //设置一排固定间距自动宽度的子 View
    func setupAutoWidthViewsWith(count: Int, margin: CGFloat) {
        
        autoWidthViewsContainer.backgroundColor = UIColor.green
        view.addSubview(autoWidthViewsContainer)
        
        
        var array = Array<Any>();
        
        for _ in 0..<count {
            let view = UIView()
            view.backgroundColor = UIColor.orange
            autoWidthViewsContainer.addSubview(view)
            _ = view.sd_layout().autoHeightRatio(1) //设置高度约束 这里设置的就是宽高比,
            // _ = view.sd_layout().heightIs(20) //可以试试直接给个高度
            array.append(view)
        }
        
        _ = autoWidthViewsContainer.sd_layout().leftSpaceToView(view, 10)?.rightSpaceToView(view, 10)?.topSpaceToView(centerButton, 10)
        
        autoWidthViewsContainer.setupAutoWidthFlowItems(array, withPerRowItemsCount: 4, verticalMargin: margin, horizontalMargin: margin, verticalEdgeInset: 5, horizontalEdgeInset: 10)
        
    }
    
    
    //设置一排固定宽度自动间距子 View
    func setupAutoMarginViewsWith(count: Int, itemWidth: CGFloat) {
        
        autoMarginViewsContainer.backgroundColor = UIColor.blue
        view.addSubview(autoMarginViewsContainer)
        
        var array = Array<Any>()
        
        for _ in 0..<count {
            let view = UIView()
            view.backgroundColor = UIColor.orange
            autoMarginViewsContainer.addSubview(view)
            _ = view.sd_layout().autoHeightRatio(0.5)
            array.append(view)
        }
        
        ///withPerRowItemsCount每一行3个,多了就会往下排列
        autoMarginViewsContainer.setupAutoMarginFlowItems(array, withPerRowItemsCount: 3, itemWidth: itemWidth, verticalMargin: 10, verticalEdgeInset: 4, horizontalEdgeInset: 10)
        
        _ = autoMarginViewsContainer.sd_layout().leftSpaceToView(view, 10)?.rightSpaceToView(view, 10)?.topSpaceToView(autoWidthViewsContainer, 10)
    }
    
    
    //设置3个水平等宽子view
    func setUpEqualWidthView() {
        
        let viewOne = UIView(backColor: UIColor.yellow)
        let viewTwo = UIView(backColor: UIColor.black)
        let viewThr = UIView(backColor: UIColor.green)
        
        
        _ = view0.sd_layout().leftEqualToView(view)?.rightEqualToView(view)?.heightIs(100)?.topSpaceToView(autoMarginViewsContainer, 20)
        
        view0.sd_addSubviews([viewOne, viewTwo, viewThr])
        view0.sd_equalWidthSubviews = [viewOne, viewTwo, viewThr]
        
        _ = viewOne.sd_layout().leftSpaceToView(view0,0)?.topSpaceToView(view0, 20)?.heightEqualToWidth() //heightEqualToWidth宽高相等,正方形
        _ = viewTwo.sd_layout().leftSpaceToView(viewOne, 0)?.topEqualToView(viewOne)?.heightEqualToWidth()
        _ = viewThr.sd_layout().leftSpaceToView(viewTwo, 0)?.rightSpaceToView(view0, 0)?.heightEqualToWidth()?.topEqualToView(viewOne)
        
    }
    
    
    
}
