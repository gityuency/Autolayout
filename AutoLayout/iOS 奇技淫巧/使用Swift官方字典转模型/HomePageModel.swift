//
//  HomePageModel.swift
//  AutoLayout
//
//  Created by EF on 2019/7/29.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import Foundation

class HomePageModel: NSObject, NSCoding, Codable {
    
    // 1号坑
    // 如果这个字段 "name_wrong_example" 在后端返回过来的 json 串里没有, 而这里定义类型 是 "String" 不是 "String?" 将会导致在 JSONDecoder 的时候字典转模型失败
    // 同样的道理, 不管定义的属性类型是什么, 只要是在 json 串里没有的, 不使用可选型,都会导致解析失败,所以,为了安全起见,把这些属性都定义为可选型吧
    //var name_wrong_example: String = "初始值,"  //错误
    //var name_wrong_example: String? = "初始值"  //正确
    //var name_wrong_example: String?            //正确
    
    var name: String?
    
    var number: Int?
    
    // 2号坑
    // 如果这个字段 "money" 在后端返回过来的 json 串里是浮点类型的, 有小数点, 那么需要定义为 Float, 如果定义为 Int, 将会导致 JSONDecoder 的时候字典转模型失败
    // 需要注意的问题是, 在json转模型的时候, 这个字段的数值精度会丢失.
    //var money: Int? = 998      //错误,定义的类型和返回的json串里的类型不一致
    //var money: Float? = 22.33  //正确 可以赋初始值
    //var money: Float?          //正确
    
    var money: Float?
    
    
    var open: Bool?

    ///"address"这个字段在 json 串里是没有的, json 串里的 "location" 字段在这个模型里面也没有定义, 这么做, 是为了查看 缺少字段, 写错字段,会不会引起崩溃
    ///如果这里的 address 不使用 可选型, 写成这样: [ var address: String = "" ]  就炸了
    var address: String?
    
    // 对象里面包含了一个数组类型的值
    var fruits: [FruitsInfo]?
    
    
    // 对象里面还包含了一个对象
    var owner: OwnerInfo?
    
    
    override init() {
        
    }
    
    // NSCoding 协议里面的方法
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: "name")
        aCoder.encode(number, forKey: "number")
        aCoder.encode(money, forKey: "money")
        aCoder.encode(open, forKey: "open")

        aCoder.encode(fruits, forKey: "fruits")
        aCoder.encode(owner, forKey: "owner")
    }
    
    // NSCoding 协议里面的方法
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        name = (aDecoder.decodeObject(forKey: "name") as? String) ?? ""
        number = aDecoder.decodeObject(forKey: "number") as? Int
        money = aDecoder.decodeObject(forKey: "money") as? Float
        
        // 3号坑
        // 在这个方法里面, 如果解码的方法调用不对,也是会造成失败, 无法顺利取出对象, 所有的属性(Bool, String, Int ...), 在解码的时候都要调用 decodeObject, 然后该转类型的转类型
        //open = aDecoder.decodeBool(forKey: "open") //错误, 不能因为我知道它是bool类型就使用 "decodeBool", 因为这里定义的属性都是可选型, 同样, 也不能使用 "decodeInteger" 这样明确解码类型的方法去解码其他可选型的属性.
        open = aDecoder.decodeObject(forKey: "open") as? Bool //正确
        
        
        fruits = aDecoder.decodeObject(forKey: "fruits") as? [FruitsInfo]
        owner = aDecoder.decodeObject(forKey: "owner") as? OwnerInfo
    }
}

/// 二级模型 水果摊
class FruitsInfo: NSObject, NSCoding, Codable {
    
    var name: String?
    var count: Int?
    var price: Float?
    var onsale: Bool?
    
    override init() {
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.count, forKey: "count")
        aCoder.encode(self.price, forKey: "price")
        aCoder.encode(self.onsale, forKey: "onsale")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        name = (aDecoder.decodeObject(forKey: "name") as? String) ?? ""
        count = aDecoder.decodeObject(forKey: "count") as? Int
        price = aDecoder.decodeObject(forKey: "price") as? Float
        onsale = aDecoder.decodeObject(forKey: "onsale") as? Bool
    }
}

/// 二级模型 商店老板
class OwnerInfo: NSObject, NSCoding, Codable {
    
    var name: String?
    var age: Int?
    
    override init() {
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(age, forKey: "age")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        name = (aDecoder.decodeObject(forKey: "name") as? String) ?? ""
        age = aDecoder.decodeObject(forKey: "age") as? Int
    }
}



extension HomePageModel {
    override var description: String {
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


extension FruitsInfo {
    override var description: String {
        return  """
        \(String(describing: name))
        \(String(describing: count))
        \(String(describing: price))
        \(String(describing: onsale))
        """
    }
}

extension OwnerInfo {
    override var description: String {
        return  """
        \(String(describing: name))
        \(String(describing: age))
        """
    }
}

