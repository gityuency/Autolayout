//
//  ThreeSecondCell.swift
//  AutoLayout
//
//  Created by yuency on 17/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class ThreeSecondCell: ThreeBaseCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        
    }
    
    
    private func setup() {
        
        let margin: CGFloat = 10
        
        contentView.sd_equalWidthSubviews = [imgIcon, imgOther1, imgOther2]
        
        _ = lblTitle.sd_layout().topSpaceToView(contentView, margin)?.leftSpaceToView(contentView, margin)?.rightSpaceToView(contentView, margin)?.heightIs(21)
        
        _ = imgIcon.sd_layout().leftSpaceToView(contentView, margin)?.topSpaceToView(lblTitle, margin)?.autoHeightRatio(0.75)
        
        _ = imgOther1.sd_layout().leftSpaceToView(imgIcon, margin)?.topSpaceToView(lblTitle, margin)?.autoHeightRatio(0.75)
        
        _ = imgOther2.sd_layout().topSpaceToView(lblTitle, margin)?.leftSpaceToView(imgOther1, margin)?.rightSpaceToView(contentView, margin)?.autoHeightRatio(0.75)
        
        _ = lineView.sd_layout().topSpaceToView(imgOther2, margin)?.leftSpaceToView(contentView, margin)?.rightSpaceToView(contentView, margin)?.heightIs(0.5)
        
        setupAutoHeight(withBottomView: lineView, bottomMargin: 0)

    }
    
    
    override var threeModel: ThreeModel? {
        didSet{
            
            lblTitle.text = threeModel?.title
            
            imgIcon.kf.setImage(with: URL(string: (threeModel?.imgsrc) ?? ""))
            
            guard let imgArray = threeModel?.imgextra else {
                return
            }
            
            imgOther1.kf.setImage(with: URL(string: imgArray[0].imgsrc ?? ""))
            imgOther2.kf.setImage(with: URL(string: imgArray[1].imgsrc ?? ""))
        }
        
    }
    
    
}
