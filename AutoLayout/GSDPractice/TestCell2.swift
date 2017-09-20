//
//  TestCell2.swift
//  AutoLayout
//
//  Created by yuency on 20/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class TestCell2: UITableViewCell {
    
    ///设置文字
    var mytext: String? {
        didSet{
            view2.text = mytext
        }
    }
    
    
    let view0 = UIImageView(backColor: UIColor.red)
    
    let view1 = UIView(backColor: UIColor.gray)
    
    let view2 = UILabel(backColor: UIColor.brown)
    
    let view3 = UIView(backColor: UIColor.orange)
    
    let view4 = UIView(backColor: UIColor.purple)
    
    let view5 = UIView(backColor: UIColor.yellow)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        
        self.selectionStyle = .none
        
        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// 初始化方法
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        view0.contentMode = .scaleAspectFit
        
        
        //添加 View
        contentView.sd_addSubviews([view0, view1, view2, view3, view4, view5])
        
        //view0
        _ = view0.sd_layout().widthIs(50)?.heightIs(50)?.topSpaceToView(contentView, 10)?.leftSpaceToView(contentView, 10)
        
        //view1
        _ = view1.sd_layout().topEqualToView(view0)?.leftSpaceToView(view0, 10)?.rightSpaceToView(contentView, 10)?.heightRatioToView(view0, 0.4)
        
        //view2
        _ = view2.sd_layout().topSpaceToView(view1, 10)?.rightSpaceToView(contentView, 60)?.leftEqualToView(view1)?.autoHeightRatio(0)
        
        //view3
        _ = view3.sd_layout().topEqualToView(view2)?.leftSpaceToView(view2, 10)?.heightRatioToView(view2, 1)?.rightEqualToView(view1)
        
        //view4
        _ = view4.sd_layout().leftEqualToView(view2)?.topSpaceToView(view2, 10)?.heightIs(30)?.widthRatioToView(view1, 0.7)
        
        //view5
        _ = view5.sd_layout().leftSpaceToView(view4, 10)?.rightSpaceToView(contentView, 10)?.bottomSpaceToView(contentView, 10)?.heightRatioToView(view4, 1)
        
        //***********************高度自适应cell设置步骤************************
        self.setupAutoHeight(withBottomView: view4, bottomMargin: 10)  //这里参照的底端的 View 要能知道这个 View 的垂直距离的确切数值, View4 可以算出垂直距离, View5 不可以, 所以这里使用 View5 就不能做到适配
        
    }
    
    
    
    
}





