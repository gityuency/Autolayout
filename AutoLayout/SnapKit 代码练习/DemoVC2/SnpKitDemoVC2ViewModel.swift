//
//  SnpKitDemoVC2ViewModel.swift
//  AutoLayout
//
//  Created by yuency on 20/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import Foundation

class SnpKitDemoVC2ViewModel {
    
    let dataArray: [SnpKitDemoCellModel]!
    
    let imageStringArray = [
        "a01",
        "a02",
        "a03",
        "a04",
        ]
    
    let nameStringArray = [
        "",
        "标题可能没有",
        "标题可能很长很长很长很长很长很长很长很长",
        ]
    
    let contentStringArray = [
        "",
        "内容可能也没有",
        "内容可能很长内容可能很长内容可能很长内容可能很长",
        "AutoLayout是什么？ Autolayout是一种布局技术，专门用来布局UI界面的。用来取代Frame布局在遇见屏幕尺寸多重多样的不足",
        ]
    
    init() {
        var array = [SnpKitDemoCellModel]()
        for _ in 0..<100 {
            let m = SnpKitDemoCellModel()
            m.imageString = imageStringArray.randomItem()
            m.leftTitle = nameStringArray.randomItem()
            m.rightTitle = contentStringArray.randomItem()
            array.append(m)
        }
        
        dataArray = array
        
        
        /*
         特别制作
         
         var keyArray = [SnpKitDemoCellModel]()
         
         let m = SnpKitDemoCellModel()
         m.imageString = imageStringArray[imageStringArray.randomIndex]
         m.leftTitle = nameStringArray[1]
         m.rightTitle = contentStringArray[1]
         keyArray.append(m)
         
         let m1 = SnpKitDemoCellModel()
         m1.imageString = imageStringArray[imageStringArray.randomIndex]
         m1.leftTitle = nameStringArray[0]
         m1.rightTitle = contentStringArray[0]
         keyArray.append(m1)
         
         let m2 = SnpKitDemoCellModel()
         m2.imageString = imageStringArray[imageStringArray.randomIndex]
         m2.leftTitle = nameStringArray[0]
         m2.rightTitle = contentStringArray[1]
         keyArray.append(m2)
         
         let m3 = SnpKitDemoCellModel()
         m3.imageString = imageStringArray[imageStringArray.randomIndex]
         m3.leftTitle = nameStringArray[1]
         m3.rightTitle = contentStringArray[0]
         keyArray.append(m3)
         
         let m4 = SnpKitDemoCellModel()
         m4.imageString = imageStringArray[imageStringArray.randomIndex]
         m4.leftTitle = nameStringArray[2]
         m4.rightTitle = contentStringArray[2]
         keyArray.append(m4)
         
         let m5 = SnpKitDemoCellModel()
         m5.imageString = imageStringArray[imageStringArray.randomIndex]
         m5.leftTitle = nameStringArray[1]
         m5.rightTitle = contentStringArray[3]
         keyArray.append(m5)
         
         dataArray = keyArray
         
         */
        
        
        
        
    }
}
