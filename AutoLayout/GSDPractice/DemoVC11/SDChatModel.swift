//
//  SDChatModel.swift
//  AutoLayout
//
//  Created by yuency on 18/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit


enum SDMessageType {
    case SDMessageTypeSendToOthers
    case SDMessageTypeSendToMe
}

class SDChatModel: NSObject {

    /// 消息类型
    var messageType: SDMessageType?
    
    /// 文字
    var text: String?
    
    ///
    var iconName: String?
    
    ///
    var imageName: String?
    
}
