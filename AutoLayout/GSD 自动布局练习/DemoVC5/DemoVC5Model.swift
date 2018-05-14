//
//  DemoVC5Model.swift
//  AutoLayout
//
//  Created by yuency on 20/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class DemoVC5Model: NSObject {
    
    //原始字段
    var iconName: String?
    
    
    var name: String? { //用这个办法修改传递进来的值
        
        didSet{
            name = "\(name ?? "") 我爱唱歌"
        }
        
    }
    
    var content: String?
    
    var picName: String? {
        
        didSet{
            
            //直接赋值图片
            modelImage = UIImage(named: (picName ?? "a01.jpg"))
            
            //计算 图片宽高比
            guard let img = modelImage else {
                return
            }
            modelImgScale = img.size.height / img.size.width            
        }
        
    }
    
    
    //计算得出的字段
    var modelImage: UIImage?
    
    var modelImgScale: CGFloat = 0.0
}
