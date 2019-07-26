//
//  RatingStarsViewController.swift
//  AutoLayout
//
//  Created by EF on 2019/5/21.
//  Copyright © 2019 yuency. All rights reserved.
//

import UIKit

class RatingStarsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    ///更换颜色的
    var setColorRatingView: SlidingRatingView!
    
    /// 演示设置和取值
    var label:UILabel!
    var ratingView: SlidingRatingView!
    var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /// 流畅滑动
        let basicLabel = UILabel(frame: nextFrame())
        basicLabel.text = "自由滑动";
        scrollView.addSubview(basicLabel)
        
        let basicRatingView = SlidingRatingView(frame: nextFrame());
        basicRatingView.sizeToFit()
        scrollView.addSubview(basicRatingView)
        
        //阶级滑动
        let stepLabel = UILabel(frame: nextFrame())
        stepLabel.text = "整颗星星滑动";
        scrollView.addSubview(stepLabel)
        
        let stepRatingView = SlidingRatingView(frame: nextFrame());
        stepRatingView.sizeToFit()
        stepRatingView.stepInterval = 1.0
        scrollView.addSubview(stepRatingView)
        
        
        //半阶滑动
        let halfStepLabel = UILabel(frame: nextFrame())
        halfStepLabel.text = "半颗星星滑动";
        scrollView.addSubview(halfStepLabel)
        
        let halfStepRatingView = SlidingRatingView(frame: nextFrame());
        halfStepRatingView.sizeToFit()
        halfStepRatingView.stepInterval = 0.5
        scrollView.addSubview(halfStepRatingView)
        
        
        //使用特殊字符
        let freeCharacterLabel = UILabel(frame: nextFrame())
        freeCharacterLabel.text = "使用特殊字符";
        scrollView.addSubview(freeCharacterLabel)
        
        let freeCharacterRatingView = SlidingRatingView(frame: nextFrame());
        freeCharacterRatingView.markCharacter = "\u{263B}"
        freeCharacterRatingView.markFont = UIFont.systemFont(ofSize: 20)
        freeCharacterRatingView.sizeToFit()
        scrollView.addSubview(freeCharacterRatingView)
        
        
        //使用图片
        let freeImageLabel = UILabel(frame: nextFrame())
        freeImageLabel.text = "使用图片";
        scrollView.addSubview(freeImageLabel)
        
        let freeImageRatingView = SlidingRatingView(frame: nextFrame());
        freeImageRatingView.markImage = UIImage(named: "Shake_icon_tv")
        freeImageRatingView.sizeToFit()
        scrollView.addSubview(freeImageRatingView)
        
        
        //使用颜色
        let setColorLabel = UILabel(frame: nextFrame())
        setColorLabel.text = "使用颜色";
        scrollView.addSubview(setColorLabel)
        
        setColorRatingView = SlidingRatingView(frame: nextFrame());
        setColorRatingView.sizeToFit()
        setColorRatingView.baseColor = UIColor.orange
        setColorRatingView.highlightColor = UIColor.green
        scrollView.addSubview(setColorRatingView)
        
        let button = UIButton(frame: nextFrame())
        button.setTitle("改变颜色", for: UIControl.State.normal)
        button.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(action_change_color), for: UIControl.Event.touchUpInside);
        scrollView.addSubview(button)
        
        
        //不可编辑
        let notEditableLabel = UILabel(frame: nextFrame())
        notEditableLabel.text = "不可编辑";
        scrollView.addSubview(notEditableLabel)
        
        let notEditableRatingView = SlidingRatingView(frame: nextFrame());
        notEditableRatingView.sizeToFit()
        notEditableRatingView.isUserInteractionEnabled = false
        notEditableRatingView.value = 4.0
        scrollView.addSubview(notEditableRatingView)
        
        
        //最小值
        let minValueLabel = UILabel(frame: nextFrame())
        minValueLabel.text = "设置一个最小值";
        scrollView.addSubview(minValueLabel)
        
        let minValueRatingView = SlidingRatingView(frame: nextFrame());
        minValueRatingView.sizeToFit()
        minValueRatingView.value = 4.0
        minValueRatingView.minimumValue = 2.0
        scrollView.addSubview(minValueRatingView)
        
        
        //更多星星
        let moreStarsLabel = UILabel(frame: nextFrame())
        moreStarsLabel.text = "更多星星";
        scrollView.addSubview(moreStarsLabel)
        
        let moreStarsRatingView = SlidingRatingView(frame: nextFrame());
        moreStarsRatingView.numberOfStar = 12
        moreStarsRatingView.sizeToFit()
        scrollView.addSubview(moreStarsRatingView)
        
        
        /// 设置值 和 取值
        label = UILabel(frame: nextFrame())
        label.text = "值的存取"
        scrollView.addSubview(label)
        
        ratingView = SlidingRatingView(frame: nextFrame());
        ratingView.stepInterval = 0
        ratingView.value = 2.5
        ratingView.isUserInteractionEnabled = true
        ratingView.addTarget(self, action: #selector(action_rating_changed), for: UIControl.Event.valueChanged)
        ratingView.sizeToFit()
        scrollView.addSubview(ratingView)
        
        slider = UISlider(frame: nextFrame())
        slider.minimumValue = 0
        slider.maximumValue = 5
        slider.addTarget(self, action: #selector(action_slider_change), for: UIControl.Event.valueChanged)
        scrollView.addSubview(slider)
    }
    
    @objc func action_change_color() {
        setColorRatingView.baseColor = UIColor.randomColor
        setColorRatingView.highlightColor = UIColor.randomColor
    }
    
    @objc func action_rating_changed(ratingView: SlidingRatingView) {
        slider.value = ratingView.value
        label.text = " 取值  \(String(format: "%.2f", ratingView.value)) "
    }
    
    
    @objc func action_slider_change(sender: UISlider) {
        ratingView.value = sender.value
        label.text = "取值  \(String(format: "%.2f", sender.value)) "
    }
    
    
    var offsetY: CGFloat = 220
    func nextFrame() -> CGRect {
        offsetY += 50;
        return CGRect(x: 100, y: offsetY, width: 200, height: 40)
    }
    
    
}
