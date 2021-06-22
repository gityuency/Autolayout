////
////  PropertyWrite.swift
////  AutoLayout
////
////  Created by aidong on 2020/12/1.
////  Copyright © 2020 姬友大人. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class PropertyWrite {
//    
//    
//    ///类属性
//    
//    static let AAA1 = UIColor.red
//    static var AAA2 = UIColor.green
//    
//    
//    
//    static var CCC1 = { () -> Int in
//        lllog("")
//        return 8 + 9;
//    }
//    
//    static var CCC2: Int = {
//        lllog("")
//        return 1 + 1;
//    }()
//    
//    
//    ///成员属性
//    
//    
//    //
//    let BBB1 = UIColor.green
//    var BBB2 = UIColor.cyan
//    
//    
//    var DDD1 = { () -> Int in
//        lllog("")
//        return 6 + 3
//    }
//    
//    var DDD2: Int = {
//        lllog("")
//        return 6 + 3
//    }()
//    
//    
//    lazy var ZZZ1 : Int = {  //懒加载只能是 var
//        lllog("")
//        return 2 + 1
//    }()
//    
//    
//    lazy var ZZZ2 = UIColor.init()
//    
//    
//    //重写 get set
//    var GGG1: UIColor {
//        get{
//            return UIColor.yellow
//        }
//        set(theG){
//            let k = UIColor.red;
//        }
//    }
//    
//    
//    var GGG2: Int {
//        willSet {
//            let _ = newValue  // newValue 自动带有的
//            GGG2 = newValue + 20
//        }
//        didSet{
//            let _ = oldValue // oldValue 自动带有的
//            GGG2 = oldValue - 100
//        }
//    }
//    
// 
//    
//    
//    
//    
//    
//}
