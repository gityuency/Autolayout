//
//  DemoVC1.swift
//  AutoLayout
//
//  Created by yuency on 15/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class DemoVC1: ViewsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //内容自适应 View
        setUpAutoHeightView()
        
        
        //宽度自适应 Label
        setUpAutoWidthLabel()
        
        
    }
    
    
    /// 内容自适应 view
    private func setUpAutoHeightView() {
        
        //设置 view1的高度根据子 View 而使用, 在 View1中加入两个子 View (testLabel和 testView) 然后设置 View1的高度根据子 View 的内容自适应
        
        //子视图1
        let subView1 = UILabel()
        subView1.text = "这个紫色的label会根据这些文字内容高度自适应；而这个灰色的父view会根据紫色的label和橙色的view具体情况实现高度自适应。\nGot it! OH YAEH!."
        subView1.backgroundColor = UIColor.purple
        subView1.textColor = UIColor.white
        
        // 子视图2
        let subView2 = UIView()
        subView2.backgroundColor = UIColor.orange
        
        //添加
        view1.sd_addSubviews([subView1,subView2])
        
        //autoHeightRatio(这个参数传的高宽的比值)
        _ =  subView1.sd_layout().leftSpaceToView(view1,10)?.rightSpaceToView(view1,10)?.topSpaceToView(view1, 10)?.autoHeightRatio(0) //设置文本内容自适应, 如果这里的参数为大于0的数值则会以此数值作为 view 的高宽比设置 View 的高度
        
        
        _ =  subView2.sd_layout().topSpaceToView(subView1, 10)?.widthRatioToView(subView1, 1)?.heightIs(30)?.leftEqualToView(subView1)
        
        
        //view1使用高度根据子 View内容自适应, 所以不需要设置高度, 而是设置  “[self.view1 setupAutoHeightWithBottomView:testView bottomMargin:10] 实现高度根据内容自适应
        _ = view1.sd_layout().leftSpaceToView(view, 10)?.topSpaceToView(view, 80)?.rightSpaceToView(view, 10)
        //使用这句话最后设置高度
        view1.setupAutoHeight(withBottomView: subView2, bottomMargin: 10)
    }
    
    
    //宽度自适应 Label
    private func setUpAutoWidthLabel() {
        
        let autoWidthlabel = UILabel()
        autoWidthlabel.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
        autoWidthlabel.font = UIFont.systemFont(ofSize: 12)
        
        autoWidthlabel.text = "宽度自适应(距离父view右边距10)"
        
        view.addSubview(autoWidthlabel)
        
        _ = autoWidthlabel.sd_layout().rightSpaceToView(view, 10)?.heightIs(20)?.bottomSpaceToView(view,50)
        autoWidthlabel .setSingleLineAutoResizeWithMaxWidth(180)
    }
    
    
    
    
    
    
}
