//
//  ThreeBaseCell.swift
//  AutoLayout
//
//  Created by yuency on 16/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit
import SDCycleScrollView


class ThreeBaseCell: UITableViewCell, SDCycleScrollViewDelegate {
    
    
    /**
     *  图片
     */
    var imgIcon = UIImageView()
    
    
    /**
     *  标题
     */
    var lblTitle = UILabel()
    
    /**
     *  描述
     */
    var lblSubtitle = UILabel()
    
    
    /**
     *  第二张图片（如果有的话）
     */
    var imgOther1 = UIImageView()
    
    
    /**
     *  第三张图片（如果有的话）
     */
    var imgOther2 = UIImageView()
    
    
    /**
     *  底部分界线
     */
    var lineView = UIImageView()
    
    
    /**
     *  滚动图片区
     */
    var cycleScrollView: SDCycleScrollView?
    
    
    // 数据模型
    var threeModel: ThreeModel?
    
    
    required override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.addSubview(imgIcon)

        lblTitle.font = UIFont.systemFont(ofSize: 15)
        lblTitle.numberOfLines = 0
        contentView.addSubview(lblTitle)

        lblSubtitle.textColor = UIColor.gray
        lblSubtitle.font = UIFont.systemFont(ofSize: 13)
        lblSubtitle.numberOfLines = 0
        contentView.addSubview(lblSubtitle)

        contentView.addSubview(lineView)
    
        contentView.addSubview(imgOther1)

        contentView.addSubview(imgOther2)
        
        //设置主题
        //...
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
