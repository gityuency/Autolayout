//
//  DemoVC4.swift
//  AutoLayout
//
//  Created by yuency on 20/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class DemoVC4: ViewsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  --------- attributedString测试：行间距为8 ---------------------------
        
        let text = "attributedString测试：行间距为8。彩虹网络卡福利费绿调查开房；卡法看得出来分开了的出口来反馈率打开了房；快烦死了；了； 调查开房；；v单纯考虑分离开都快来反馈来看发v离开的积分房积分jdhflgfkkvvm.cm。attributedString测试：行间距为8。彩虹网络卡福利费绿调查开房；卡法看得出来分开了的出口来反馈率打开了房；快烦死了；了； 调查开房；；v单纯考虑分离开都快来反馈来看发v离开的积分房积分jdhflgfkkvvm.cm。";
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        let color = UIColor.red
        
        let attrString = NSAttributedString(string: text, attributes: [NSForegroundColorAttributeName: color, NSParagraphStyleAttributeName: paragraphStyle])
        
        
        let label = UILabel()
        view.addSubview(label)
        label.attributedText = attrString
        label.backgroundColor = UIColor.green
        
        
        _ = label.sd_layout().leftSpaceToView(view, 10)?.rightSpaceToView(view, 10)?.topSpaceToView(view, 100)?.autoHeightRatio(0)
        
        // 标注lable的text为attributedString
        label.isAttributedContent = true;
        
        
        //  --------- attributedString测试：行间距为8 ---------------------------
    }
    
}
