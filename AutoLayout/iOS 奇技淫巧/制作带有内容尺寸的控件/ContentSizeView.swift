//
//  ContentSizeView.swift
//  AutoLayout
//
//  Created by EF on 2019/7/26.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit

@IBDesignable
class ContentSizeView: UIView {
    
    @IBInspectable var count: CGFloat = 5 {
        didSet {
            print("-------->   \(#function) \(#line)")
            
            
            /*
             可以手动调用这句话来刷新布局
             self.invalidateIntrinsicContentSize()
             */
            
            
            /*
             用这两句话也能刷新布局,触发layoutsubviews
             setNeedsLayout()
             layoutIfNeeded()
             */
            
            
            /*
             用这个触发重绘,也能刷新布局
             setNeedsDisplay()
             */
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("-------->   \(#function) \(#line)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("-------->   \(#function) \(#line)")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("-------->   \(#function) \(#line)")
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        print("-------->   \(#function) \(#line)")
        
        return self.intrinsicContentSize;
    }
    
    override var intrinsicContentSize: CGSize {
        print("-------->   \(#function) \(#line)")
        
        return CGSize(width: 20 * count, height: 20 * count)
    }
    
    override func sizeToFit() {
        super.sizeToFit()
        print("-------->   \(#function) \(#line)")
        
        frame = CGRect(origin: self.frame.origin, size: self.intrinsicContentSize)        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("-------->   \(#function) \(#line)")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("-------->   \(#function) \(#line)")
    }
}

/*
 函数调用顺序
 
 -------->   init(coder:) 47
 -------->   awakeFromNib() 52
 -------->   intrinsicContentSize 62
 -------->   layoutSubviews() 76
 -------->   draw(_:) 81
 
 */




/// 最简单的实现内容高度,只要重写下面这两个方法就可以
class ContentSizeViewSimple: UIView {
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        print("-------->   \(#function) \(#line)")
        return self.intrinsicContentSize;
    }
    
    override var intrinsicContentSize: CGSize {
        print("-------->   \(#function) \(#line)")
        return CGSize(width: 150, height: 150)
    }
}
