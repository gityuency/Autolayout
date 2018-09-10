//
//  DynamicUILabelViewController.swift
//  AutoLayout
//
//  Created by 去年的那个夏天 on 2018/9/10.
//  Copyright © 2018年 去年的那个夏天. All rights reserved.
//

import UIKit

class DynamicUILabelViewController: UIViewController {

    let nameLabel: UILabel = {

        var v = UILabel()
        v.text = "根据系统设置动态放大/缩小字体"
        // 设置字体大小
        v.font = UIFont.preferredFont(forTextStyle: .body)
        
        // 允许调整
        if #available(iOS 10.0, *) {
            v.adjustsFontForContentSizeCategory = true
        }
        
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            
            make.left.equalTo(view.left).offset(10)
            
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom).offset(20)
            }
        }
    }
}
