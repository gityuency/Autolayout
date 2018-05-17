//
//  String+Extension.swift
//  AutoLayout
//
//  Created by yuency on 14/05/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import Foundation

extension String {
    
    /// 返回第一次出现的指定子字符串在此字符串中的索引 （如果backwards参数设置为true，则返回最后出现的位置）
    func positionOf(sub:String, backwards:Bool = false) ->Int {
        var pos = -1
        if let range = range(of:sub, options: backwards ? .backwards : .literal ) {
            if !range.isEmpty {
                pos = self.distance(from:startIndex, to:range.lowerBound)
            }
        }
        return pos
    }
    
    
    /// 获取子字符串 示例用法 ``` let str4 = str.substingInRange(3..<6) ```
    func substingInRange(_ r: Range<Int>) -> String? {
        if r.lowerBound < 0 || r.upperBound > self.count {
            return nil
        }
        let startIndex = self.index(self.startIndex, offsetBy:r.lowerBound)
        let endIndex   = self.index(self.startIndex, offsetBy:r.upperBound)
        return String(self[startIndex..<endIndex])
    }
    
    
    /// 查找字符串中的汉字
    func stringToHanZiArray() -> (stringArray: [String], string: String) {
        
        var result = self
        
        let regex = "[\\u4e00-\\u9fa5]"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        for (i, hanzi) in self.enumerated() {
            let isValid = predicate.evaluate(with: String(hanzi))
            if isValid == false { //不是汉字
                let r = self.index(self.startIndex, offsetBy: i)..<self.index(self.startIndex, offsetBy: i+1)
                result.replaceSubrange(r, with: " ")
            }
        }
        print("除掉汉字以外的字符串\n \(result)")
        let separatedArray = result.components(separatedBy: " ")
        print("按照空格分割的数组\n \(separatedArray)")
        let finalArray = separatedArray.filter { string -> Bool in
            return string.count > 0
        }
        print("最终的数组\n \(finalArray)")
        
        ///数组元素合并为字符串
        let finalString = finalArray.joined(separator: "")
        print("最终的字符串\n \(finalString)")
        
        return (finalArray, finalString)
    }
    
    
    
    /**
     正则表达式获取目的子串
     - parameter pattern: 一个字符串类型的正则表达式
     - parameter str: 需要比较判断的对象
     - imports: 这里子串的获取先转话为NSString的[以后处理结果含NS的还是可以转换为NS前缀的方便]
     - returns: 返回目的字符串结果值数组(目前将String转换为NSString获得子串方法较为容易)
     - warning: 注意匹配到结果的话就会返回true，没有匹配到结果就会返回false
     */
    func regexGetSubString(pattern:String) -> [String] {
        var subStr = [String]()
        let regex = try! NSRegularExpression(pattern: pattern, options:[NSRegularExpression.Options.caseInsensitive])
        let results = regex.matches(in: self, options: NSRegularExpression.MatchingOptions.init(rawValue: 0), range: NSMakeRange(0, self.count))
        //解析出子串
        for  rst in results {
            let nsStr = self as  NSString  //可以方便通过range获取子串
            subStr.append(nsStr.substring(with: rst.range))
            //str.substring(with: Range<String.Index>) //本应该用这个的，可以无法直接获得参数，必须自己手动获取starIndex 和 endIndex作为区间
        }
        return subStr
    }
    
    
    /**
     正则表达判断是否含有结果值
     - parameter pattern: 一个字符串类型的正则表达式
     - parameter str: 需要比较判断的对象
     - returns: 返回布尔值判断结果
     - warning: 注意匹配到结果的话就会返回true，没有匹配到结果就会返回false
     */
    func regexContainSubString(pattern:String) -> Bool {
        let regex = try! NSRegularExpression(pattern: pattern, options:[NSRegularExpression.Options.caseInsensitive])
        let resultNum = regex.numberOfMatches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0) , range: NSMakeRange(0, self.count))
        if resultNum >= 1 {
            return true
        }
        return false
    }
    
}
