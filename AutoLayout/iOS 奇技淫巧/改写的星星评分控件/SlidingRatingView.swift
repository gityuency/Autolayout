//
//  SlidingRatingView.swift
//  姬友大人
//
//  Created by 姬友大人 on 2019/5/20.
//  Copyright © 2019 FunPlus. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class SlidingRatingView: UIControl {
    
    private var starMaskLayer: CALayer?
    ///正常状态
    private var basementLayer: CALayer?
    ///高亮状态
    private var highlightLayer: CALayer?
    
    ///计算得到文字大小
    private var cachedMarkCharacterSize = CGSize.zero;
    
    /// 星星个数的浮点型数据,用于计算,省的每次都要转换
    private var numberOfStar_float: CGFloat = 5
    
    // 设置星星的个数
    @IBInspectable var numberOfStar: Int = 5 {
        didSet {
            if oldValue != numberOfStar {
                numberOfStar_float = CGFloat(numberOfStar)
                self.invalidateIntrinsicContentSize()
                self.setNeedsDisplay()
            }
        }
    }
    
    //设置默认的字符
    @IBInspectable var markCharacter: String = "\u{2605}" {
        didSet {
            if oldValue != markCharacter {
                markImage = nil
                cachedMarkCharacterSize = CGSize.zero
                self.invalidateIntrinsicContentSize()
                self.setNeedsDisplay()
            }
        }
    }
    
    ///设置默认的字体
    @IBInspectable var markFont: UIFont = UIFont.systemFont(ofSize: 22) {
        didSet {
            if oldValue != markFont {
                markImage = nil;
                setNeedsDisplay()
            }
        }
    }
    
    
    ///如果有图片,优先使用图片, 如果没有图片就使用文字
    @IBInspectable var markImage: UIImage?
    
    ///正常颜色
    @IBInspectable var baseColor: UIColor = UIColor.lightGray {
        didSet {
            if oldValue != baseColor {
                basementLayer?.removeFromSuperlayer();
                basementLayer = nil
                setNeedsDisplay();
            }
        }
    }
    
    ///高亮颜色
    @IBInspectable var highlightColor: UIColor = UIColor.red {
        didSet {
            if oldValue != highlightColor {
                highlightLayer?.removeFromSuperlayer()
                starMaskLayer?.removeFromSuperlayer()
                highlightLayer = nil
                starMaskLayer = nil
                setNeedsDisplay()
            }
        }
    }
    
    ///当前的值
    @IBInspectable var value: Float = 0.0 {
        didSet {
            if oldValue != value {
                value = min(max(value, 0.0), Float(numberOfStar_float))
                setNeedsDisplay()
            }
        }
    }
    
    ///步长
    @IBInspectable var stepInterval: CGFloat = 0.0 {
        didSet {
            stepInterval = max(stepInterval, 0.0)
        }
    }
    
    ///最小值
    @IBInspectable var minimumValue: CGFloat = 0.0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func sizeToFit() {
        super.sizeToFit()
        self.frame = CGRect(origin: self.frame.origin, size: self.intrinsicContentSize)
    }
    
    /// 这个是什么,没有见过
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return self.intrinsicContentSize;
    }
    
    override var intrinsicContentSize: CGSize {
        var size = CGSize.zero
        if let markImage = markImage {
            size = markImage.size
        } else {
            size = needMarkCharacterSize()
        }
        return CGSize(width: size.width * numberOfStar_float, height: size.height);
    }
    
    override func draw(_ rect: CGRect) {
        
        if starMaskLayer == nil {
            
            starMaskLayer = needMaskLayer();
            layer.mask = starMaskLayer;
            
            basementLayer = needBasementLayer();
            layer.addSublayer(basementLayer!);
            
            highlightLayer = needHighlightLayer()
            layer.addSublayer(highlightLayer!);
        }
        
        let selfWidth =  markImage!.size.width * numberOfStar_float
        let selfHalfWidth = selfWidth / 2
        let selfHalfHeight = frame.size.height / 2
        let frameOffsetX = (frame.size.width - selfWidth) / 2;
        let offsetX = selfWidth / numberOfStar_float * (numberOfStar_float - CGFloat(value))
        CATransaction.begin()
        CATransaction.setValue(true, forKey: kCATransactionDisableActions)
        highlightLayer?.position = CGPoint(x: selfHalfWidth - (offsetX - frameOffsetX), y: selfHalfHeight)
        CATransaction.commit()
    }
    
    /// 这个方法返回字符的尺寸
    func needMarkCharacterSize() -> CGSize {
        if cachedMarkCharacterSize.equalTo(CGSize.zero) {  //如果这个缓存之前没有存下数据, 是空的, 就重新计算
            let size: CGSize = markCharacter.size(withAttributes: [NSAttributedString.Key.font: markFont])
            cachedMarkCharacterSize = size;
        }
        return cachedMarkCharacterSize
    }
    
    /// 返回图片
    func needMarkImage() -> UIImage {
        
        if let markImage = markImage {  //如果有图片,就直接返回图片
            
            return markImage
            
        } else { //如果没有图片,就返回文字生成的图片
            
            let size = self.needMarkCharacterSize()
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            UIColor.black.set()
            let text: NSString =  NSString(cString: markCharacter.cString(using: .utf8)!, encoding: String.Encoding.utf8.rawValue)!
            text.draw(at: CGPoint.zero, withAttributes: [NSAttributedString.Key.font: markFont, NSAttributedString.Key.foregroundColor: UIColor.black]);
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            markImage = image
            return markImage!
        }
    }
    
    
    /// 生成 mask layer
    func needMaskLayer() -> CALayer {
        
        // 这里是按照p图片生成的 image, 一定是有东西的
        markImage = self.needMarkImage();
        
        let starMaskLayer = CALayer();
        starMaskLayer.isOpaque = false;
        
        if let markimage = markImage {
            
            let markWidth = markimage.size.width;
            let markHalfWidth = markWidth / 2
            let markHeight = markimage.size.height
            let markHalfHeight = markHeight / 2;
            
            for i in 0..<numberOfStar {
                let starLayer = CALayer()
                starLayer.contents = markimage.cgImage
                starLayer.bounds = CGRect(origin: CGPoint.zero, size: markimage.size)
                starLayer.position = CGPoint(x: markHalfWidth + markWidth * CGFloat(i), y: markHalfHeight)
                starMaskLayer.addSublayer(starLayer)
            }
            let totalStartsWidth = (markWidth * numberOfStar_float);
            let frameOffsetX = (self.frame.size.width - totalStartsWidth) / 2
            let frameOffsetY = (self.frame.size.height - markimage.size.height) / 2
            starMaskLayer.frame = CGRect(x: frameOffsetX, y: frameOffsetY, width: markimage.size.width * numberOfStar_float, height: markimage.size.height)
        }
        return starMaskLayer;
    }
    
    /// 设置  Basement Layer
    func needBasementLayer() -> CALayer {
        let layer = CALayer()
        layer.backgroundColor = baseColor.cgColor
        if let markimage = markImage {
            layer.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: markimage.size.width * numberOfStar_float, height: markimage.size.height))
            layer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        }
        return layer;
    }
    
    /// 生成高亮laier
    func needHighlightLayer() -> CALayer {
        let layer = CALayer()
        layer.backgroundColor = highlightColor.cgColor
        if let markimage = markImage {
            layer.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: markimage.size.width * numberOfStar_float, height: markimage.size.height))
            layer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        }
        return layer;
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesMoved(touches, with: event)
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self)
        if let markimage = markImage {
            let totalStartsWidth = markimage.size.width * numberOfStar_float
            let frameOffsetX = (frame.size.width - totalStartsWidth ) / 2
            let frameOffsetY = (frame.size.height - markimage.size.height) / 2
            let rect = CGRect(x: frameOffsetX - markimage.size.width, y: frameOffsetY, width: totalStartsWidth + markimage.size.width, height: markimage.size.height)
            if rect.contains(location!) {
                var value = ((location!.x - frameOffsetX) / (markimage.size.width * numberOfStar_float) * numberOfStar_float);
                if stepInterval != 0 {
                    value = max(minimumValue, ceil(value / stepInterval) * stepInterval)
                } else {
                    value = max(minimumValue, value)
                }
                self.value = Float(value)
                self .sendActions(for: UIControl.Event.valueChanged)
            }
        }
    }
}
