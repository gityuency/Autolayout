//
//  Array+Extension.swift
//  AutoLayout
//
//  Created by yuency on 19/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import Foundation


extension Array {

    /// 获得这个数组的随机下标
    var randomIndex: Int {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return index
    }
    
    /// 获取这个数组的随机元素
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        let item = self[index]
        return item
    }

}



