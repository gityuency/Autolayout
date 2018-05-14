//
//  ThreeThirdCell.swift
//  AutoLayout
//
//  Created by yuency on 18/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit


class ThreeThirdCell: ThreeBaseCell {
    
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
        
        _ = lblTitle.sd_layout().leftSpaceToView(contentView, margin)?.topSpaceToView(contentView, margin)?.rightSpaceToView(contentView, margin)?.heightIs(21)
        
        _ = imgIcon.sd_layout().topSpaceToView(lblTitle, margin)?.rightSpaceToView(contentView, margin)?.leftSpaceToView(contentView, margin)?.heightIs(130)
        
        _ = lblSubtitle.sd_layout().topSpaceToView(imgIcon, margin)?.rightSpaceToView(contentView, margin)?.leftSpaceToView(contentView, margin)?.autoHeightRatio(0)
        
        _ = lineView.sd_layout().topSpaceToView(lblSubtitle,margin)?.leftEqualToView(contentView)?.rightEqualToView(contentView)?.heightIs(0.5)
        
        setupAutoHeight(withBottomView: lineView, bottomMargin: 0)
    }
    
    override var threeModel: ThreeModel?{
        didSet{
            
            lblTitle.text = threeModel?.title
            lblSubtitle.text = threeModel?.digest  //副标题有就显示,没有就隐藏
            imgIcon.kf.setImage(with: URL(string: threeModel?.imgsrc ?? ""), placeholder: UIImage(named: "303"))
        }
    }
}
