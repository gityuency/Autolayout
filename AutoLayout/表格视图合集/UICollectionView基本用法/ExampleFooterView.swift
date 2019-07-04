//
//  ExampleFooterView.swift
//  AutoLayout
//
//  Created by EF on 2019/6/28.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit

class ExampleFooterView: UICollectionReusableView {
    
    static let reuseId = "ExampleFooterView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
