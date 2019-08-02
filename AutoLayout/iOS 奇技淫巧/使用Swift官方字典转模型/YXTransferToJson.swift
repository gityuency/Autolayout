//
//  YXTransferToJson.swift
//  AutoLayout
//
//  Created by EF on 2019/8/1.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import Foundation

/*
 来自网上的解释
 
 NSJSONReadingMutableContainers：返回可变容器，NSMutableDictionary或NSMutableArray。
 
 NSJSONReadingMutableLeaves：返回的JSON对象中字符串的值为NSMutableString，目前在iOS 7上测试不好用，应该是个bug，参见：
 http://stackoverflow.com/questions/19345864/nsjsonreadingmutableleaves-option-is-not-working
 
 NSJSONReadingAllowFragments：允许JSON字符串最外层既不是NSArray也不是NSDictionary，但必须是有效的JSON Fragment。例如使用这个选项可以解析 @“123” 这样的字符串。参见：
 http://stackoverflow.com/questions/16961025/nsjsonserialization-nsjsonreadingallowfragments-reading
 */


/// 字典转模型工具类,  重复代码不抽取
struct YXTransferToJson {
    
    /// 模型转字符串
    public static func model<T>(toString model: T) -> String? where T: Encodable {
        
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        guard let data = try? jsonEncoder.encode(model) else {
            print("❌ jsonEncoder解码失败!")
            return nil
        }
        
        guard let jsonString = String(data: data, encoding: .utf8) else {
            print("❌ data到字符串失败!")
            return nil
        }
        return jsonString
    }
    
    /// 模型转字典
    public static func model<T>(toDictionary model: T) -> [String: Any]? where T: Encodable {
        
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        guard let data = try? jsonEncoder.encode(model) else {
            print("❌ jsonEncoder解码失败!")
            return nil
        }
        
        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
            print("❌ data到字典失败!")
            return nil
        }
        return dictionary
    }
    
    /// 模型转数组
    public static func model<T>(toArray model: T) -> [Any]? where T: Encodable {
        
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        guard let data = try? jsonEncoder.encode(model) else {
            print("❌ jsonEncoder解码失败!")
            return nil
        }
        
        guard let array = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Any] else {
            print("❌ data到数组失败!")
            return nil
        }
        return array
    }
}


