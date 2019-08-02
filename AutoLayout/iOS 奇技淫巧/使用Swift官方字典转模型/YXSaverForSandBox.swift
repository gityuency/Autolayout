//
//  YXSaverForSandBox.swift
//  AutoLayout
//
//  Created by EF on 2019/8/1.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import Foundation

/// 把 模型对象 或者 模型数组 存到 沙盒 里面, 重复代码不抽取
struct YXSaverForSandBox {
    
    static let KeyCacheModelName = "取一个好听的名字"
    
    static let KeyCacheArrayName = "你叫姬友最好听"
    
    private static let YXModelCache = "YXModelCache" //真机下面好像不能直接使用 Document 文件夹, 会引起崩溃, 所以自己创建一个文件夹
    
    private static let dateFormatter = DateFormatter()
    
    /// 把 模型对象 存到 沙盒 里面
    static func saveToSandBox(key: String, with modelObject: NSCoding) {
        
        guard let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            print("❌ 获取沙盒目录失败!")
            return
        }
        
        let userDirPath = URL(fileURLWithPath: docPath).appendingPathComponent(YXModelCache)
        
        guard (try? FileManager.default.createDirectory(at: userDirPath, withIntermediateDirectories: true, attributes: [:])) != nil else {
            print("❌ 创建沙盒文件目录失败!")
            return
        }
        
        let dataFullPath = "\(docPath)/\(YXModelCache)/\(key)"
        
        NSKeyedArchiver.archiveRootObject(modelObject, toFile: dataFullPath)
    }
    
    /// 把 模型对象 从 沙盒 里取出来
    static func fetchFromSandBox<T>(key: String, asObject type: T.Type) -> T? where T: NSCoding {
        
        guard let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            print("❌ 获取沙盒目录失败!")
            return nil
        }
        
        let dataFullPath = "\(docPath)/\(YXModelCache)/\(key)"
        
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: dataFullPath) as? T else {
            print("❌ unarchiveObject 失败!")
            return nil
        }
        return data
    }
    
    /// 把 模型数组 存到 沙盒 里面
    static func saveToSandBox(key: String, with modelArray: [NSCoding]) {
        
        guard let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            print("❌ 获取沙盒目录失败!")
            return
        }
        
        let userDirPath = URL(fileURLWithPath: docPath).appendingPathComponent(YXModelCache)
        
        guard (try? FileManager.default.createDirectory(at: userDirPath, withIntermediateDirectories: true, attributes: [:])) != nil else {
            print("❌ 创建沙盒文件目录失败!")
            return
        }
        
        let dataFullPath = "\(docPath)/\(YXModelCache)/\(key)"
        
        NSKeyedArchiver.archiveRootObject(modelArray, toFile: dataFullPath)
    }
    
    /// 把 模型数组 从 沙盒 里取出来
    static func fetchFromSandBox<T>(key: String, asArray type: T.Type) -> [T]? where T: NSCoding {
        
        guard let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            print("❌ 获取沙盒目录失败!")
            return nil
        }
        
        let dataFullPath = "\(docPath)/\(YXModelCache)/\(key)"
        
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: dataFullPath) as? [T] else {
            print("❌ unarchiveObject 失败!")
            return nil
        }
        return data
    }
    
    /// 把模型存到沙盒中,使用日期区分,这样会存很多的文件
    static func save(model: NSCoding) {
        
        let date = Date()
        dateFormatter.dateFormat = "yyyy年 MM月 dd日 HH时 mm分 ss秒 SSS毫秒"
        let strDate = dateFormatter.string(from: date)
        
        guard let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            print("❌ 获取沙盒目录失败!")
            return
        }
        
        let userDirPath = URL(fileURLWithPath: docPath).appendingPathComponent(YXModelCache)
        
        guard (try? FileManager.default.createDirectory(at: userDirPath, withIntermediateDirectories: true, attributes: [:])) != nil else {
            print("❌ 创建沙盒文件目录失败!")
            return
        }
        
        let dataFullPath = "\(docPath)/\(YXModelCache)/\(strDate)"
        
        NSKeyedArchiver.archiveRootObject(model, toFile: dataFullPath)
    }
    
    /// 删掉沙盒里的文件
    static func removeAll() {
        
        guard let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            print("❌ 获取沙盒目录失败!")
            return
        }
        
        let dirPath = "\(docPath)/\(YXModelCache)"
        
        guard ((try? FileManager.default.removeItem(atPath: dirPath)) != nil) else {
            print("❌ 删除文件夹失败!")
            return
        }
    }
}
