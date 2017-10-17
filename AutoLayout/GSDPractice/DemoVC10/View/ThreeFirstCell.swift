//
//  ThreeFirstCell.swift
//  AutoLayout
//
//  Created by yuency on 16/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class ThreeFirstCell: ThreeBaseCell {
    
    
    required init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        
        let margin: CGFloat = 10
        
        _ = imgIcon.sd_layout().leftSpaceToView(contentView, margin)?.topSpaceToView(contentView, margin)?.widthIs(90)?.heightIs(65);
        
        _ = lblTitle.sd_layout().leftSpaceToView(imgIcon, margin)?.topSpaceToView(contentView, margin)?.rightSpaceToView(contentView, margin)?.autoHeightRatio(0)
        
        
        _ = lblSubtitle.sd_layout().topSpaceToView(lblTitle, margin)?.leftSpaceToView(imgIcon, margin)?.rightSpaceToView(contentView, margin)?.autoHeightRatio(0)
        
        _ = lineView.sd_layout().bottomEqualToView(contentView)?.leftSpaceToView(contentView, 0)?.rightSpaceToView(contentView, 0)?.heightIs(0.5)
        
        
        setupAutoHeight(withBottomViewsArray: [lblSubtitle, imgIcon], bottomMargin: (margin + 1))
        
    }
    
    
    override var threeModel: ThreeModel? {
        
        didSet {
            
            lblTitle.text = threeModel?.title
            lblSubtitle.text = threeModel?.digest
            

        }
        
    }
    
    
}
