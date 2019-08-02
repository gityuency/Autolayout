//
//  YXSaverForUserDefaults.swift
//  AutoLayout
//
//  Created by EF on 2019/8/1.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import Foundation

/// 把 模型对象 或者 模型数组 存到 UserDefaults 里面, 重复代码不抽取
struct YXSaverForUserDefaults {
    
    //MARK: - Key
    static let KeyHomePageModel = "KeyHomePageModel"
    
    static let KeyFruitsArray = "KeyFruitsArray"
    
    //MARK: - Model
    /// 把 模型对象 存到 UserDefaults 里面
    static func saveToUserDefaults(key: String, with modelObject: NSCoding) {
        let data = NSKeyedArchiver.archivedData(withRootObject: modelObject)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    /// 把 模型对象 从 UserDefaults 里取出来
    static func fetchFromUserDefaults<T>(key: String, asObject type: T.Type) -> T? where T: NSCoding {
        
        guard let data = UserDefaults.standard.value(forKey: key) as? Data else {
            print("❌ 从UserDefault里解析data失败!")
            return nil
        }
        
        guard let model = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? T else {
            print("❌ data转模型失败!")
            return nil
        }
        return model
    }
    
    //MARK: - Array
    /// 把 模型数组 存到 UserDefaults 里面
    static func saveToUserDefaults(key: String, with modelArray: [NSCoding]) {
        let data = NSKeyedArchiver.archivedData(withRootObject: modelArray)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    /// 把 模型数组 从 UserDefaults 里取出来
    static func fetchFromUserDefaults<T>(key: String, asArray type: T.Type) -> [T]? where T: NSCoding {
        
        guard let data = UserDefaults.standard.value(forKey: key) as? Data else {
            print("❌ 从UserDefault里解析data失败!")
            return nil
        }
        
        guard let array = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [T] else {
            print("❌ data转模型失败!")
            return nil
        }
        return array
    }
    
    /// 清理数据
    static func clearCacheModel(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
