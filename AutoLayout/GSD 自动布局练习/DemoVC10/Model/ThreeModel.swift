//
//  ThreeModel.swift
//  AutoLayout
//
//  Created by yuency on 16/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit
import YYModel

class ThreeModel: NSObject {
    
    /// 头条?
    var tname: String?
    
    ///新闻发布时间
    var ptime: String?
    
    ///标题
    var title: String?
    
    /// 跟帖人数
    var replyCount: Int = 0
    
    ///新闻ID
    var docid: String?
    
    /// 图片连接
    var imgsrc: String?
    
    /// 描述
    var digest: String?
    
    ///大图样式
    var imgType: Int = 0
    
    /**
     *  多图数组
     *  里面放的是Imgextra模型
     */
    var imgextra: Array<Imgextra>?
    
    /**
     *  里面放的是Editor模型
     */
    var editor: Array<Editor>?
    
    /**
     *  里面放的是Ads模型
     */
    var ads: Array<Ads>?
    
    
    //一些其他的属性
    var hasHead: Int = 0

    
    
    
    
    //调用此方法后，问题解决
    static func modelContainerPropertyGenericClass() ->[String : AnyObject]? {
        return ["imgextra": Imgextra.self, "editor": Editor.self, "ads": Ads.self];
    }
    
    override var description: String {
        return yy_modelDescription()
    }
    
}





class Ads: NSObject {
    
    var title: String?
    
    var tag: String?
    
    var imgsrc: String?
    
    var subtitle: String?
    
    var url: String?
    
    override var description: String {
        return yy_modelDescription()
    }
    
}



class Editor: NSObject {
    
    
    override var description: String {
        return yy_modelDescription()
    }
    
}


class Imgextra: NSObject {
    
    var imgsrc: String?
    
    
    override var description: String {
        return yy_modelDescription()
    }
    
}

