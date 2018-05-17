//
//  Magic_0_ViewController.swift
//  AutoLayout
//
//  Created by yuency on 17/05/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit

class Magic_0_ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let ori = """
    Sophia周圣涵    Mina    HF F    U1    L4        N    Y    5/6/2018    24        0   https://odinp汉字2lus.ef.cn/contact/25047074    https://omni-operation.ef.cn/group/714832/session/33219600/uni734138477@189.comt/2/cgfdsfdsgfdsovered-in-class2  jay734138477@qq.com  too expensive,840538 wont buy it   今天不*-/%*&(行 SH01   http://www.baidu.com/  qi
"""
        /// 示例 获得所有汉字
        let _ = ori.stringToHanZiArray()
        
        /// 示例 获得指定的字符串
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"  //邮箱正则
        let resArray =  ori.regexGetSub(pattern: regex)
        print(resArray)
        
    }

}
