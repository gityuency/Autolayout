//
//  SnpKitCellOptimizationViewModel.swift
//  AutoLayout
//
//  Created by yuency on 17/05/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import Foundation

class SnpKitCellOptimizationViewModel {
    
    let dataArray: [SnpKitDemoCellModel]!
    
    let contentStringArray = [
        "Color Blended layers: 标示混合的图层会为红色,不透明的图层为绿色，通常我们希望绿色的区域越多越好。",
        "Color Hits Green and Misses Red: 假如我们设置viewlayer的shouldRasterize为YES，那些成功被缓存的layer会标注为绿色，反之为红色.",
        "Color copied images: 标示那些被Core Animation拷贝的图片。这主要是因为该图片的色彩格式不能被GPU直接处理，需要在CPU这边做转换，假如在主线层做这个操作对性能会有一定的影响。",
        "Color misaligned images: 被缩放的图片会被标记为黄色,像素不对齐则会标注为紫色。",
        "Color offscreen-rendered yellow: 标示哪些layer需要做离屏渲染(offscreen-render)。"
        ]
    
    init() {
        var array = [SnpKitDemoCellModel]()
        for _ in 0..<PlistManager.needAllChineseName.count {
            let m = SnpKitDemoCellModel()
            m.image = BundleImageManager.needAllImage.randomItem()
            m.leftTitle = PlistManager.needAllChineseName.randomItem()
            m.rightTitle = contentStringArray.randomItem()
            array.append(m)
        }
        dataArray = array
    }
}

