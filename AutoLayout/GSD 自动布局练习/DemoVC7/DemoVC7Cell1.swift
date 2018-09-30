//
//  DemoVC7Cell1.swift
//  AutoLayout
//
//  Created by yuency on 22/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class DemoVC7Cell1: UITableViewCell {
    
    var model: DemoVC7Model? {
        didSet{
            titleLabel.text = model?.title
            iconView.image = UIImage(named: (model?.imagePathsArray?.first ?? "a01.ajpg"))
        }
    }
    
    let titleLabel = UILabel()
    
    let iconView = UIImageView()
    
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    
        contentView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = UIColor.brown.withAlphaComponent(0.9)
        
        
        
        contentView.addSubview(iconView)
        iconView.layer.borderColor = UIColor.gray.cgColor
        iconView.layer.borderWidth = 1
        iconView.backgroundColor = UIColor.orange
        
        let margin: CGFloat = 15
        
        _ = titleLabel.sd_layout().leftSpaceToView(contentView, margin)?.topSpaceToView(contentView, margin)?.rightSpaceToView(contentView, 120)?.autoHeightRatio(0)
        
        _ = iconView.sd_layout().topEqualToView(titleLabel)?.leftSpaceToView(titleLabel, margin)?.rightSpaceToView(contentView, margin)?.heightIs(60)
        
        // 当你不确定哪个view在自动布局之后会排布在cell最下方的时候可以调用次方法将所有可能在最下方的view都传过去
        self.setupAutoHeight(withBottomViewsArray: [titleLabel, iconView], bottomMargin: margin)

        
    }
    
    
}
