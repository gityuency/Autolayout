//
//  AttributeTextViewController.swift
//  AutoLayout
//
//  Created by EF on 2019/8/23.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit

class AttributeTextViewController: UIViewController {
    
    @IBOutlet weak var llll1: UILabel!
    
    @IBOutlet weak var llll2: UILabel!
    
    @IBOutlet weak var llll3: UILabel!
    
    @IBOutlet weak var llll4: UILabel!
    
    @IBOutlet weak var llll5: UILabel!
    
    @IBOutlet weak var llll6: UILabel!
    
    @IBOutlet weak var llll7: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        demo1()
        
        demo2()
        
        demo3()
        
        demo4()
        
        demo5()
        
        demo6()
        
        demo7()
    }
    
    func demo7() {
        let oriString = "给文字添加红色的下划线"
        let attrString = NSMutableAttributedString(string: oriString)
        attrString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: 6))
        attrString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor.red, range: NSRange(location: 0, length: 6))
        llll7.attributedText = attrString
    }
    
    func demo6() {
        let oriString = "给文字添加阴影"
        let attrString = NSMutableAttributedString(string: oriString)
        let shadow = NSShadow.init()
        shadow.shadowColor = UIColor.red
        shadow.shadowOffset = CGSize.init(width: 2, height: 2)
        attrString.addAttribute(NSAttributedString.Key.shadow, value: shadow, range: NSRange(location: 0, length: 3))
        llll6.attributedText = attrString
    }
    
    func demo5() {
        let oriString = "修改文字的大小"
        let attrString = NSMutableAttributedString(string: oriString)
        attrString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 2, length: 3))
        llll5.attributedText = attrString
    }
    
    func demo4() {
        let oriString = "修改文字的背景色"
        let attrString = NSMutableAttributedString(string: oriString)
        attrString.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.magenta, range: NSRange.init(location:2, length: 5))
        llll4.attributedText = attrString
    }
    
    func demo3() {
        let oriString = "文字添加删除线"
        let attrString = NSMutableAttributedString(string: oriString)
        attrString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber.init(value: 1), range: NSRange.init(location:0, length: oriString.count))
        llll3.attributedText = attrString
    }
    
    func demo2() {
        let oriString = "改变文字的字间距"
        let attrString = NSMutableAttributedString(string: oriString, attributes: [NSAttributedString.Key.kern : 10])
        llll2.attributedText = attrString
    }
    
    func demo1() {
        let oriString = "给部分文字改变文字颜色"
        let attrString = NSMutableAttributedString.init(string: oriString)
        let range = NSRange(location: 0, length: 6)
        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
        llll1.attributedText = attrString
    }
    
}
