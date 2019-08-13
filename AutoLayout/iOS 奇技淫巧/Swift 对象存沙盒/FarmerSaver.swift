//
//  FarmerSaver.swift
//  AutoLayout
//
//  Created by EF on 2019/8/13.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import Foundation

/// 把 模型对象 或者 模型数组 存到 沙盒 里面, 重复代码不抽取
struct FarmerSaver {
    
    static let key = "活到老学到死" //存的文件名
    
    private static let YXFramerCache = "YXFramerCache" //文件夹名字
    
    /// 把 模型对象 存到 沙盒 里面
    static func save(data: DataConvertible, key: String) {
        
        guard let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            print("❌ 获取沙盒目录失败!")
            return
        }
        
        let userDirPath = URL(fileURLWithPath: docPath).appendingPathComponent(YXFramerCache)
        
        guard (try? FileManager.default.createDirectory(at: userDirPath, withIntermediateDirectories: true, attributes: [:])) != nil else {
            print("❌ 创建沙盒文件目录失败!")
            return
        }
        
        let dataFullPath = "\(docPath)/\(YXFramerCache)/\(key)"
        
        // 这一步直接把 model 转换成 data, 方法:convertToData 来自于这个model 继承重写的协议方法
        if let converted = data.convertToData() {
            // 直接根据路径存入 data
            NSKeyedArchiver.archiveRootObject(converted, toFile: dataFullPath)
        }
        
        print("存储路径\n\(dataFullPath)")
    }
    
    /// 把 模型对象 从 沙盒 里取出来
    static func loadDataWithCodable(key: String) -> Data? {
        
        guard let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            print("❌ 获取沙盒目录失败!")
            return nil
        }
        
        let dataFullPath = "\(docPath)/\(YXFramerCache)/\(key)"
        
        //直接根据路径解出 data
        if let data = NSKeyedUnarchiver.unarchiveObject(withFile: "\(dataFullPath)") as? Data {
            return data
        }
        return nil
    }
    
    /// 删掉沙盒里的文件
    static func removeAll() {
        guard let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            print("❌ 获取沙盒目录失败!")
            return
        }
        let dirPath = "\(docPath)/\(YXFramerCache)"
        guard ((try? FileManager.default.removeItem(atPath: dirPath)) != nil) else {
            print("❌ 删除文件夹失败! / 没有这个文件夹!")
            return
        }
        print("✅ 清理成功!")
    }
}
