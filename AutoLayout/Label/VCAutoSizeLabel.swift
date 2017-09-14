//
//  VCAutoSizeLabel.swift
//  AutoLayout
//
//  Created by yuency on 14/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class VCAutoSizeLabel: UIViewController {
    
    let label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        label.backgroundColor = UIColor.orange
        label.text = "能不能给我一首歌的时间,按钮设置了最大宽度200"
        
        view.sd_addSubviews([label])
        
        _ = label.sd_layout().centerYEqualToView(view)?.centerXEqualToView(view)?.autoHeightRatio(0)
        label.setSingleLineAutoResizeWithMaxWidth(200)
        
        
    }
    
}
