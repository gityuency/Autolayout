//
//  BundleImageManager.swift
//  AutoLayout
//
//  Created by yuency on 17/05/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import Foundation
import UIKit

/// 图片资源 文件管理器
class BundleImageManager {
    
    /// 获得 Bundle 里面的所有图片
    static let needAllImage: [UIImage] = {
        let paths = Set([".jpg", ".png", ".jpeg"].map { fileExtension in
            Bundle.main.paths(forResourcesOfType: fileExtension, inDirectory: nil)
            }.joined())
        var images = [UIImage]()
        for path in paths {
            if let  img = UIImage.init(contentsOfFile: path) {
                images.append(img)
            }
        }
        return images
    }()
    
    
    /// 获取头像
    static let needAllHeadImage: [UIImage] = {
        var names = [String]()
        for i in 0..<15 {
            names.append("headimage\(i)")
        }
        var images = [UIImage]()
        for name in names {
            if let img = UIImage.init(named: name) {
                images.append(img)
            }
        }
        return images
    }()

    
    /// 获取碧池
    static let needAllBitchesImage: [UIImage] = {
        var names = [String]()
        for i in 0..<8 {
            names.append("bitches\(i)")
        }
        var images = [UIImage]()
        for name in names {
            if let img = UIImage.init(named: name) {
                images.append(img)
            }
        }
        return images
    }()
    
    
}


