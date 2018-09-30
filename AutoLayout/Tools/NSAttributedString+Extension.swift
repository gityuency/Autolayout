//
//  NSAttributedString+Extension.swift
//  AutoLayout
//
//  Created by yuency on 14/05/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
    
    /// 指定宽度返回富文本的高度
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
    }
    
    /// 指定高度返回富文本的宽度
    func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.width)
    }
}

extension NSAttributedString {
    
    /// SwifterSwift: Apply attributes to substrings matching a regular expression
    ///
    /// - Parameters:
    ///   - attributes: Dictionary of attributes
    ///   - pattern: a regular expression to target
    /// - Returns: An NSAttributedString with attributes applied to substrings matching the pattern
    public func applying(attributes: [NSAttributedString.Key: Any], toRangesMatching pattern: String) -> NSAttributedString {
        guard let pattern = try? NSRegularExpression(pattern: pattern, options: [NSRegularExpression.Options.caseInsensitive]) else { return self }
        
        let matches = pattern.matches(in: string, options: [], range: NSRange(0 ..< length))
        let result = NSMutableAttributedString(attributedString: self)
        
        for match in matches {
            result.addAttributes(attributes, range: match.range)
        }
        
        return result
    }
    
    /// SwifterSwift: Apply attributes to occurrences of a given string
    ///
    /// - Parameters:
    ///   - attributes: Dictionary of attributes
    ///   - target: a subsequence string for the attributes to be applied to
    /// - Returns: An NSAttributedString with attributes applied on the target string
    public func applying<T: StringProtocol>(attributes: [NSAttributedString.Key: Any], toOccurrencesOf target: T) -> NSAttributedString {

        // let pattern = "^(.*?(\\b\(target)\\b)[^$]*)$"
        
        // let pattern = "\\Q\(target)\\E"
        
        let pattern = "\(target)"
        
        return self.applying(attributes: attributes, toRangesMatching: pattern)
    }
}
