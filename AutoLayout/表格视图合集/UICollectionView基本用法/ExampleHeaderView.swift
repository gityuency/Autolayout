//
//  ExampleHeaderView.swift
//  AutoLayout
//
//  Created by EF on 2019/6/28.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit

class ExampleHeaderView: UICollectionReusableView {
    
    static let reuseId = "ExampleHeaderView"

    //报错: Could not cast value of type 'UICollectionReusableView' (0x1135d3be0) to 'AutoLayout.ExampleHeaderView' (0x107c27a68).
    // 1. 打开 XIB
    // 2. 选择右边第三个 "show theh identity inspector"
    // 3. 把类名改成我们当前的这个类名, 重新运行
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
