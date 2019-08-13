//
//  FarmerModel.swift
//  AutoLayout
//
//  Created by EF on 2019/8/13.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import Foundation

/// 一个用于 model -> data 的协议
@objc protocol DataConvertible : class {
    func convertToData() -> Data?
}

class FarmerModel: Codable, DataConvertible {
    
    /// 重写协议里的方法
    func convertToData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    /// 自己写的方法
    static func convert(from data: Data) -> FarmerModel? {
        return try? JSONDecoder().decode(FarmerModel.self, from: data)
    }
    
    var name: String?
    var number: Int?
    var money: Float?
    var open: Bool?
    var address: String?
    var fruits: [FarmerFruits]?
    var owner: FarmerOwner?
}

/// 二级模型 水果摊
class FarmerFruits: Codable {
    var name: String?
    var count: Int?
    var price: Float?
    var onsale: Bool?
}

/// 二级模型 商店老板
class FarmerOwner: Codable {
    var name: String?
    var age: Int?
}


extension FarmerModel: CustomStringConvertible {
    var description: String {
        return  """
        \(String(describing: name))
        \(String(describing: number))
        \(String(describing: money))
        \(String(describing: open))
        \(String(describing: address))
        \(String(describing: fruits))
        \(String(describing: owner))
        """
    }
}

extension FarmerFruits: CustomStringConvertible {
    var description: String {
        return  """
        \(String(describing: name))
        \(String(describing: count))
        \(String(describing: price))
        \(String(describing: onsale))
        """
    }
}

extension FarmerOwner: CustomStringConvertible {
    var description: String {
        return  """
        \(String(describing: name))
        \(String(describing: age))
        """
    }
}
