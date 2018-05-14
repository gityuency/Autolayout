//
//  SearchResultDisplayViewController.swift
//  AutoLayout
//
//  Created by yuency on 14/05/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit

class SearchResultDisplayViewController: UIViewController {
    
    @IBOutlet var textview: UITextView!
    @IBOutlet var label: UILabel!
    @IBOutlet var searchfield: UITextField!
    
    var oriString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oriString = textview.text
        NotificationCenter.default.addObserver(self, selector: #selector(searchAction), name: NSNotification.Name.UITextFieldTextDidChange, object: searchfield)
    }
    
    @objc func searchAction(notif: NSNotification) {
        guard let t = notif.object as? UITextField, let searchTxt = t.text else {
            return
        }
        ///把 Label 的文字显示写了一句代码
        MessageDisplayTool.handleDisplayMessage(searchTxt: searchTxt, oriString: oriString, messageLabel: label)
    }
    
    @IBAction func clearAction(_ sender: Any) {
        textview.text = ""
        label.text = "输入新的搜索文本"
        oriString = ""
    }
    
    @IBAction func setupAction(_ sender: Any) {
        oriString = textview.text
        label.text = oriString
    }
}

/// 搜索文本的显示工具
class MessageDisplayTool {
    
    /// 匹配字符串,更改 Label 显示样式
    static func handleDisplayMessage(searchTxt: String, oriString: String, messageLabel: UILabel) {
        
        messageLabel.superview?.layoutIfNeeded()
        
        /// 除掉多余的换行
        let fatherString = oriString.replacingOccurrences(of: "\r", with: "").replacingOccurrences(of: "\n", with: "")
        
        /// 找到匹配文本从左到右第一次出现的位置
        let position1 = fatherString.lowercased().positionOf(sub: searchTxt.lowercased())
        
        if position1 < 0 {
            messageLabel.text = searchTxt
            return
        }
        
        let labelWidth = messageLabel.frame.size.width
        let labelFont = messageLabel.font ?? UIFont.systemFont(ofSize: 17.0)
        
        var indexFirst = position1 < 0 ? 0 : (position1 + searchTxt.count)
        indexFirst = (indexFirst + 3) < fatherString.count ? (indexFirst + 3) : indexFirst //如果搜索的文本出现在了目标文本中间, 为了显示好看, 多往后显示3个文字
        let i1 = fatherString.index(fatherString.startIndex, offsetBy: indexFirst)
        let actuallyCleanURL = fatherString[..<i1]
        let finalString = String(actuallyCleanURL)
        let size: CGSize = finalString.size(withAttributes: [NSAttributedStringKey.font: labelFont])  //取第一次匹配到的结果,往后多截3个文字,然后拿宽度去比较
        
        let of2 =  position1 < 0 ? 0 : position1
        let start = fatherString.index(fatherString.startIndex, offsetBy: of2)
        let i2String = fatherString[start..<fatherString.endIndex]  //这里取的是 第一次搜索到的子串 到 父串尾部的 串, 然后拿到宽度
        let finalString2 = String(i2String)
        let size2_W = finalString2.size(withAttributes: [NSAttributedStringKey.font: labelFont]).width
        
        if labelWidth > size.width {  //这里要把最终字符串的宽度和 Label 的宽度进行比较, 才能确定显示的样式
            messageLabel.attributedText = MessageDisplayTool.attriMessage(searchTxt: searchTxt, oriString: fatherString)
            messageLabel.lineBreakMode = .byTruncatingTail
        } else {
            if size2_W < labelWidth {  //如果子串的宽度小于 Label 宽度,就显示父串
                messageLabel.attributedText = MessageDisplayTool.attriMessage(searchTxt: searchTxt, oriString: fatherString)
            } else {                   //如果子串的宽度大于 Label 宽度,就显示子串, 这个子串是截取后的
                messageLabel.attributedText = MessageDisplayTool.attriMessage(searchTxt: searchTxt, oriString: "\(finalString)...")
            }
            messageLabel.lineBreakMode = .byTruncatingHead
        }
    }
    
    /// 添加富文本高亮
    static func attriMessage(searchTxt: String, oriString: String) -> NSAttributedString {
        let attri: NSAttributedString = NSAttributedString(string: oriString)
        let newAttri = attri.applying(attributes: [NSAttributedStringKey.foregroundColor: UIColor.red], toOccurrencesOf: searchTxt)
        return newAttri;
    }
    
}


