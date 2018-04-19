//
//  UIColor+Extension.swift
//  Animations
//
//  Created by yuency on 12/12/2017.
//  Copyright © 2017 sunny. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIColor 扩展
extension UIColor {
    
    
    /// 用数值初始化颜色，便于生成设计图上标明的十六进制颜色  UIColor(valueRGB: 0x666666, alpha: 1.0)
    convenience init(valueRGB: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((valueRGB & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((valueRGB & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(valueRGB & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    
    convenience init(hex: UInt32) {
        let r = (hex & 0xff0000) >> 16
        let g = (hex & 0x00ff00) >> 8
        let b = hex & 0x0000ff
        self.init(red: r, green: g, blue: b)
    }
    
    convenience init(red: UInt32, green: UInt32, blue: UInt32) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1)
    }
    
    /// 获得随机颜色
    static var randomColor: UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256)) / 255.0, green: CGFloat(arc4random_uniform(256)) / 255.0, blue: CGFloat(arc4random_uniform(256)) / 255.0, alpha: 1)
    }
    
}

