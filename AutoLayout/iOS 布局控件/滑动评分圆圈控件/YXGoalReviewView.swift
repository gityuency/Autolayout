//
//  YXGoalReviewView.swift
//  AutoLayout
//
//  Created by EF on 2019/7/29.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit

private let circuleWidthAndHeight: CGFloat = 40

private let fixedInfoViewHeight: CGFloat = 35

private let gapBetweenCircleAndText: CGFloat = 8

// 使用的时候,高度能够自己弄出来,但是宽度不能,如果字符串太长,就会超出父控件的范围.

@IBDesignable
class YXGoalReviewView: UIControl {

    var stringsArray: [String] = ["戏", "说不", "是胡说", "改编不是", "乱编", "向全国人民谢罪", "律师函警告"]

    private var subLayersRects = [CGRect]()
    
    private var layersArray = [CircularLayer]()
    
    private var infoViewsArray = [InfoView]()
    
    private var usingArray: [String] = [String]()

    @IBInspectable var value: Int = 0 {
        didSet {
            refreLabel(value: value)
            refreshView(value: value - 1)
        }
    }

    @IBInspectable var totalCount: Int = 5 {
        didSet {
            
            // 这里是为了把 totalCount 和 stringsArray 里字符串的个数调整一致
            usingArray.removeAll()
            for i in 0..<totalCount {
                if i < stringsArray.count {
                    usingArray.append(stringsArray[i])
                } else {
                    usingArray.append("两开花")
                }
            }
            
            // 这里开始准备控件
            layer.sublayers?.removeAll()
            layersArray.removeAll()
            
            _ = infoViewsArray.map { v in
                v.removeFromSuperview()
            }
            infoViewsArray.removeAll()
            
            for i in 0..<totalCount {
                
                let l = CircularLayer()
                layer.addSublayer(l)
                layersArray.append(l)
                
                let v = InfoView()
                if i < usingArray.count {
                    v.setInfo(index: "\(i + 1)", description: usingArray[i])
                }
                addSubview(v)
                infoViewsArray.append(v)
            }
            invalidateIntrinsicContentSize()
        }
    }
    
    @IBInspectable var itemHeightLightColor: UIColor = UIColor.green {
        didSet {
            if oldValue != itemHeightLightColor {
                refreshView(value: value - 1)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let floatTotalCount = CGFloat(totalCount)
        let oriX = (frame.width - (floatTotalCount * circuleWidthAndHeight + (floatTotalCount - 1) * innerMargin)) / 2
        subLayersRects.removeAll()
        for (index, l) in layersArray.enumerated() {
            
            l.frame = CGRect(x: oriX + CGFloat(index) * (circuleWidthAndHeight + innerMargin), y: 0, width: circuleWidthAndHeight, height: circuleWidthAndHeight)
            subLayersRects.append(l.frame)
            
            let v = infoViewsArray[index]
            v.center = CGPoint(x: l.frame.midX, y: circuleWidthAndHeight + v.frame.height / 2 + gapBetweenCircleAndText)
        }
    }
    
    func refreLabel(value: Int)  {
        
        if value == 0 {
            for (index, view) in infoViewsArray.enumerated() {
                if index == 0 || index == totalCount - 1 {
                    view.isHidden = false
                    view.setInfoViewColor(defaultColor: true)
                } else {
                    view.isHidden = true
                    view.setInfoViewColor(defaultColor: false)
                }
            }
        } else if value > 0 && value <= totalCount {
            for (index, view) in infoViewsArray.enumerated() {
                view.setInfoViewColor(defaultColor: false)
                view.isHidden = (index == value - 1 ? false : true)
            }
        } else {
            for view in infoViewsArray {
                view.setInfoViewColor(defaultColor: false)
                view.isHidden = false
            }
        }
    }
    
    private func refreshView(value: Int) {
        for (index, l) in layersArray.enumerated() {
            if index <= value {
                l.heightLightLayer.backgroundColor = itemHeightLightColor.cgColor
            } else {
                l.heightLightLayer.backgroundColor = UIColor.white.cgColor
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesMoved(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: self) {
            for (selectedIndex, rect) in subLayersRects.enumerated() {
                if rect.contains(location) { //在View上滑动的时候
                    refreLabel(value: selectedIndex)
                    self.value = selectedIndex + 1
                    self.sendActions(for: UIControl.Event.valueChanged)
                    refreshView(value: selectedIndex)
                    return
                } else if location.x < 0 {    //滑出了最左边
                    refreLabel(value: 0)
                    self.value = 0
                    self.sendActions(for: UIControl.Event.valueChanged)
                    refreshView(value: -1)
                    return
                }
            }
        }
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return self.intrinsicContentSize;
    }
    
    let innerMargin: CGFloat = 16
    
    override var intrinsicContentSize: CGSize {
        let countFloat = CGFloat(totalCount)
        
        let w = countFloat * circuleWidthAndHeight + (countFloat - 1) * innerMargin
        
        return CGSize(width: w, height: fixedInfoViewHeight + circuleWidthAndHeight + gapBetweenCircleAndText)
    }
}

private class CircularLayer: CALayer {
    
    var heightLightLayer: CALayer = {
        let l = CALayer()
        return l
    }()
    
    override init(layer: Any) {
        super.init(layer: layer)
        setUp()
    }
    
    override init() {
        super.init()
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp() {
        frame = CGRect(x: 0, y: 0, width: circuleWidthAndHeight, height: circuleWidthAndHeight)
        borderColor = grayColor.cgColor
        backgroundColor = UIColor.white.cgColor
        
        let subwh = circuleWidthAndHeight * 0.6
        borderWidth = bounds.width * 0.1
        
        cornerRadius = circuleWidthAndHeight / 2
        
        let centerXY = (bounds.width - subwh) / 2
        heightLightLayer.frame = CGRect(x: centerXY, y: centerXY, width: subwh, height: subwh)
        heightLightLayer.cornerRadius = subwh * 0.5
        addSublayer(heightLightLayer)
    }
}

private let grayColor = UIColor.lightGray

/// 这个是圆圈下方文本控件
@IBDesignable
class InfoView: UIView {
    
    private var numberLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont.boldSystemFont(ofSize: 16)
        return v
    }()
    
    private var descLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont.systemFont(ofSize: 12)
        return v
    }()
    
    private func setUp() {
        addSubview(numberLabel)
        addSubview(descLabel)
    }
    
    @IBInspectable var one: String = "" {
        didSet {
            numberLabel.text = one
            numberLabel.sizeToFit()
            invalidateIntrinsicContentSize()
        }
    }
    
    @IBInspectable var two: String = "" {
        didSet {
            descLabel.text = two
            descLabel.sizeToFit()
            invalidateIntrinsicContentSize()
        }
    }
    
    func setInfoViewColor(defaultColor: Bool)  {
        if defaultColor {
            numberLabel.textColor = grayColor
            descLabel.textColor = grayColor
        } else {
            numberLabel.textColor = UIColor.black
            descLabel.textColor = UIColor.black
        }
    }
    
    func setInfo(index: String, description: String)  {
        numberLabel.text = index
        descLabel.text = description
        numberLabel.sizeToFit()
        descLabel.sizeToFit()
        invalidateIntrinsicContentSize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        setUp()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        numberLabel.frame = CGRect(origin: CGPoint(x: (frame.width - numberLabel.frame.width) / 2, y: 0), size: numberLabel.frame.size)
        descLabel.frame = CGRect(origin: CGPoint(x: (frame.width - descLabel.frame.width) / 2, y: numberLabel.frame.maxY), size: descLabel.frame.size)
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return self.intrinsicContentSize;
    }
    
    override var intrinsicContentSize: CGSize {
        let w = max(numberLabel.frame.width, descLabel.frame.width)
        return CGSize(width: w, height: fixedInfoViewHeight)
    }
}

