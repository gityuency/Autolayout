//
//  SnpKitDemoVC0ViewModel.swift
//  AutoLayout
//
//  Created by yuency on 19/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import Foundation

class SnpKitDemoVC0ViewModel {
    
    let dataArray: [[SnpKitDemoVC0Model]]!
    
    let nameArray = [
        "小浣熊干脆面",
        "名字要长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长",
        "因为，这两种约束不可能同时存在，只能满足一个，那么满足谁呢？默认情况下给UIView加的这几个约束优先级都是1000，属于最高的优先级了，表示此约束必须满足。",
        ]
    
    init() {
        var a1 = [Array<SnpKitDemoVC0Model>]()
        for _ in 0..<3 {
            var a2 = [SnpKitDemoVC0Model]()
            for _ in 0..<20 {
                let m = SnpKitDemoVC0Model()
                m.name = nameArray[nameArray.randomIndex]
                a2.append(m)
            }
            a1.append(a2)
        }
        dataArray = a1
    }
}


class SnpKitDemoVC0Model {
    var name = ""
    var tag = ""
}


extension Array {
    /// 给定一个数组,获得随机的索引
    var randomIndex: Int {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return index
    }
}





