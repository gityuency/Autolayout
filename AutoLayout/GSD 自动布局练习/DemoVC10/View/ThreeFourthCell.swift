//
//  ThreeFourthCell.swift
//  AutoLayout
//
//  Created by yuency on 17/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit
import SDCycleScrollView

class ThreeFourthCell: ThreeBaseCell {
    
    
    
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setup() {
        
        cycleScrollView = SDCycleScrollView()
        contentView.addSubview(cycleScrollView!)
        
        let margin: CGFloat = 0
        
        _ = cycleScrollView?.sd_layout().topEqualToView(contentView)?.leftEqualToView(contentView)?.rightEqualToView(contentView)?.heightIs(175)
        setupAutoHeight(withBottomView: cycleScrollView, bottomMargin: margin)
        
    }
    
    
    override var threeModel: ThreeModel? {
        didSet{
            
            var titleArray = Array<String>()
            var imgArray = Array<String>()
            
            for ads in threeModel?.ads ?? [] {
                titleArray.append(ads.title ?? "")
                imgArray.append(ads.imgsrc ?? "")
            }
            
            cycleScrollView?.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
            cycleScrollView?.pageControlStyle = SDCycleScrollViewPageContolStyleClassic
            cycleScrollView?.delegate = self as SDCycleScrollViewDelegate
            cycleScrollView?.titlesGroup = titleArray
            cycleScrollView?.imageURLStringsGroup = imgArray
            cycleScrollView?.currentPageDotColor = UIColor.white
            cycleScrollView?.placeholderImage = UIImage(named: "303")
            
        }
    }
    
    
}
