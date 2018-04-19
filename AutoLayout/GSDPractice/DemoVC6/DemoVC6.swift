
//
//  DemoVC6.swift
//  AutoLayout
//
//  Created by yuency on 20/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class DemoVC6: ViewsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        
        scrollView.sd_addSubviews([view0, view1, view2, view3, view4, view5, view6, view7, view8])
        
        //把滚动视图的内置insert弄掉?
        scrollView.sd_layout().spaceToSuperView(UIEdgeInsets())
        
        
        _ = view0.sd_layout().leftSpaceToView(scrollView, 20)?.rightSpaceToView(scrollView, 20)?.topSpaceToView(scrollView, 20)?.heightIs(150)
        
        _ = view1.sd_layout().widthIs(200)?.heightIs(200)?.centerXEqualToView(scrollView)?.topSpaceToView(view0, 20)
        
        _ = view2.sd_layout().leftSpaceToView(scrollView, 50)?.rightSpaceToView(scrollView, 50)?.topSpaceToView(view1, 20)?.heightIs(150)
        
        _ = view3.sd_layout().widthIs(250)?.heightEqualToWidth()?.centerXEqualToView(scrollView)?.topSpaceToView(view2, 20)
        
        
        // scrollview自动contentsize
        scrollView.setupAutoContentSize(withBottomView: view3, bottomMargin: 20)
        
        view0.sd_cornerRadiusFromHeightRatio = 0.5
        view1.sd_cornerRadiusFromWidthRatio = 0.5
        view2.sd_cornerRadiusFromWidthRatio = 0.5
        
    }
    
}
