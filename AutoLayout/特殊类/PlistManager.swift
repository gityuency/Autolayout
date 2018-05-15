//
//  PlistManager.swift
//  AutoLayout
//
//  Created by yuency on 27/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import Foundation

/// Plist 文件管理器
class PlistManager {
    
    /// 获得本项目中的 plist 文件内容 中文名数组
    static func needAllChineseName() -> [String] {
        guard let path = Bundle.main.path(forResource: "NameList_Unfamiliar", ofType: "plist"),
            let array = NSArray(contentsOfFile: path),
            let namelist = array as? [String] else {
                return ["姬友大人"]
        }
        return namelist
    }
    
    
    /// 找出数组里面重复出现的字符串
    static func duplicateFinde(array: [String]) {
        let set: Set = Set(array)
        for key in set {
            var count = 0
            for s in array {
                if key == s {
                    count += 1
                }
            }
            if count > 1 {
                print("元素: \"\(key)\" 出现次数 \(count)")
            }
        }
    }
    
}

