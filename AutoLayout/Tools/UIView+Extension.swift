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
        
    /// 创建一个带有随机色的背景的 View
    convenience init(randomColorDark: Bool) {
        self.init()
        let alpha: CGFloat = randomColorDark == true ? 1 : 0.2
        backgroundColor = UIColor.randomColor.withAlphaComponent(alpha)
    }
    
}
