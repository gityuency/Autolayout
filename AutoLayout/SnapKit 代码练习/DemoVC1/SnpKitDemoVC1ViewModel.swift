//
//  SnpKitDemoVC1ViewModel.swift
//  AutoLayout
//
//  Created by yuency on 19/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import Foundation


class SnpKitDemoVC1ViewModel {
    
    let dataArray: [SnpKitDemoCellModel]!
    
    let leftStringArray = [
        "左标题 123456",
        "左标题 123456789",
        "左标题 123456789 ABCDEFGHIJKLMN",
        "左标题 123456789 ABCDEFGHIJKLMN 长长长长长长",
        ]
    
    let rightStringArray = [
        "右标题 123456",
        "右标题 123456789",
        "右标题 ABCDEFGHIJKMN",
        "右标题 ABCDEFGHIJKMN 长长长长长",
        ]
    
    init() {
        var array = [SnpKitDemoCellModel]()
        for _ in 0..<40 {
            let m = SnpKitDemoCellModel()
            m.leftTitle = leftStringArray[leftStringArray.randomIndex]
            m.rightTitle = rightStringArray[rightStringArray.randomIndex]
            array.append(m)
        }
        dataArray = array
    }
}

