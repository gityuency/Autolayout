//
//  DemoVC5TableViewCell.swift
//  AutoLayout
//
//  Created by yuency on 20/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class DemoVC5TableViewCell: UITableViewCell {
    
    //模型
    var model: DemoVC5Model? {
        
        didSet{
            
            view0.image = UIImage(named: (model?.iconName ?? ""))
            
            view1.text = model?.name
            
            view2.text = model?.content
            
            var bottomMargin: CGFloat = 0
            
            //在实际的开发中, 网络图片的宽高应该由服务器返回然后计算宽高比
            
            /* GSD 原来的代码里面进行了计算
            if let img = UIImage(named: (model?.picName ?? "")) {
                let scale = img.size.height / img.size.width
                _ = view3.sd_layout().autoHeightRatio(scale)
                view3.image = img
                bottomMargin = 10.0
                view4.isHidden = true
            } else {
                _ = view3.sd_layout().autoHeightRatio(0)
                view4.isHidden = false
            }
            */
            
            // 我把部分计算的逻辑放到了 model 里面
            if let img = model?.modelImage { //有图片
                _ = view3.sd_layout().autoHeightRatio(model?.modelImgScale ?? 0)
                view3.image = img
                bottomMargin = 10.0
                view4.isHidden = true
            } else { //没有图片
                _ = view3.sd_layout().autoHeightRatio(0)
                view4.isHidden = false
            }
            
            
            //***********************高度自适应cell设置步骤************************
            self.setupAutoHeight(withBottomView: view3, bottomMargin: bottomMargin)
        }
    }
    
    var view0 = UIImageView(backColor: UIColor.red)
    
    var view1 = UILabel(backColor: UIColor.lightGray)
    
    var view2 = UILabel(backColor: UIColor.gray)
    
    var view3 = UIImageView(backColor: UIColor.orange)
    
    var view4 = UILabel(backColor: UIColor.lightGray)
    
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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        
    }
    
    private func setup() {
        
        view1.font = UIFont.systemFont(ofSize: 16)
        
        view2.font = UIFont.systemFont(ofSize: 16)
        view2.numberOfLines = 0
        
        view4.textColor = UIColor.white
        view4.text = "纯文本"
        view4.font = UIFont.systemFont(ofSize: 14)
        
        contentView.sd_addSubviews([view0, view1, view2, view3, view4])
        
        //开始 cell 布局
        
        //view0 "头像"
        _ = view0.sd_layout().widthIs(40)?.heightIs(40)?.topSpaceToView(contentView, 10)?.leftSpaceToView(contentView, 10)
        //设置圆角半径
        view0.sd_cornerRadiusFromWidthRatio = 0.5
        
        
        //view1 "网名"
        _ = view1.sd_layout().topEqualToView(view0)?.leftSpaceToView(view0, 10)?.heightRatioToView(view0, 0.4)
        //设置单行文本的最大宽度
        view1.setSingleLineAutoResizeWithMaxWidth(200)
        
        
        //view2
        _ = view2.sd_layout().topSpaceToView(view1, 10)?.rightSpaceToView(contentView, 10)?.leftEqualToView(view1)?.autoHeightRatio(0)
        
        
        //view3 "图片,这里图片没有设置高度约束" 固定了宽度, 动态计算高度
        _ = view3.sd_layout().topSpaceToView(view2, 10)?.leftEqualToView(view2)?.widthRatioToView(view2, 0.7)
        
        
        //view4 " 没有图片时候网名旁边的 纯文本"
        _ = view4.sd_layout().leftSpaceToView(view1, 5)?.centerYEqualToView(view1)?.heightIs(14)
        //设置单行文本的最大宽度
        view4.setSingleLineAutoResizeWithMaxWidth(50)
        
    }
    
}
