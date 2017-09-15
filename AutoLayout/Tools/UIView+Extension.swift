//
//  UIView+Extension.swift
//  AutoLayout
//
//  Created by yuency on 14/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// 创建一个有背景色的 view
    convenience init(backColor: UIColor = UIColor.red) {
        self.init()
        backgroundColor = backColor
    }
    
}
