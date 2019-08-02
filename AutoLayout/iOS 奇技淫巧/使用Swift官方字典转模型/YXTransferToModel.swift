//
//  YXTransferToModel.swift
//  AutoLayout
//
//  Created by EF on 2019/8/1.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import Foundation

/// 字典转模型工具类,  重复代码不抽取
struct YXTransferToModel {
    
    /// 字典转模型
    public static func toModelObject<T>(_ dictionary: Any?, to type: T.Type) -> T? where T: Decodable {
        
        guard let dictionary = dictionary else {
            print("❌ 传入的数据解包失败!")
            return nil
        }
        
        if !JSONSerialization.isValidJSONObject(dictionary) {
            print("❌ 不是合法的json对象!")
            return nil
        }
        
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: []) else {
            print("❌ JSONSerialization序列化失败!")
            return nil
        }
        
        guard let model = try? JSONDecoder().decode(type, from: data) else {
            print("❌ JSONDecoder字典转模型失败!")
            return nil
        }
        
        return model
    }
    
    /// 数组转模型
    public static func toModelArray<T>(_ array: Any?, to type: T.Type) -> [T]? where T: Decodable {
        
        guard let array = array else {
            print("❌ 传入的数据解包失败!")
            return nil
        }
        
        if !JSONSerialization.isValidJSONObject(array) {
            print("❌ 不是合法的json对象!")
            return nil
        }
        
        guard let data = try? JSONSerialization.data(withJSONObject: array, options: []) else {
            print("❌ JSONSerialization序列化失败!")
            return nil
        }
        
        guard let arrayModel = try? JSONDecoder().decode([T].self, from: data) else {
            print("❌ JSONDecoder数组转模型失败!")
            return nil
        }
        
        return arrayModel
    }
}
