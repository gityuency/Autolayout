//
//  Bundle+Extension.swift
//  EFParents
//
//  Created by yuency on 11/08/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import Foundation


// MARK: - Bunle 扩展
extension Bundle {
    
    /// 获取命名空间
    var nameSpaceStirng: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
