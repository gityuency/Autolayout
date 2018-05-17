//
//  SnpKit_DemoVC_2_CellTableViewCell.swift
//  AutoLayout
//
//  Created by yuency on 20/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit

class SnpKit_DemoVC_2_Cell: UITableViewCell {
    
    static let resuseId = "SnpKit_DemoVC_2_Cell"
    
    let nameLabel: UILabel = {
        var v = UILabel()
        v.font = UIFont.systemFont(ofSize: 18)
        v.textColor = UIColor.white
        v.backgroundColor = UIColor.blue
        v.text = "nameLabel"
        return v
    }()
    
    let contentLabel: UILabel = {
        var v = UILabel()
        v.font = UIFont.systemFont(ofSize: 14)
        v.textColor = UIColor.white
        v.backgroundColor = UIColor.purple
        v.numberOfLines = 0
        v.text = "contentLabel"
        return v
    }()
    
    let headImageView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 30
        return v
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        optimizationCell()
        
        self.backgroundColor = UIColor.randomColor.withAlphaComponent(0.3)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(headImageView)
        
        headImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
            make.height.width.equalTo(60)
            
            // 距离cell 底部的约束, 用来确定 cell 的高度, 但是优先级比较低, 因为有个 ContentLabel, 如果不设置这个, SnapKit 就会在控制台报约束警告, 很烦.很烦.
            make.bottom.lessThanOrEqualToSuperview().offset(-20).priority(.low)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(headImageView.snp.right).offset(20)
            make.top.equalToSuperview().offset(20)
            make.right.lessThanOrEqualToSuperview().offset(-20)
        }
        
        
        contentLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.right.lessThanOrEqualToSuperview().offset(-20)
            
            /*
             距离cell 底部的约束, 用来确定 cell 的高度,
             优先级比 headImageView 高, 因为要让这个内容完全显示出来, 当没有内容的时候, 才会去使用 headImageView 距离 cell 底部的约束
             */
            make.bottom.lessThanOrEqualToSuperview().offset(-20)
        }
        
        
    }
    
    private func optimizationCell() {
        //离屏渲染 - 异步绘制  会使得表格更流畅,但是 CPU 会消耗更多 就这么一句话
        self.layer.drawsAsynchronously = true
        //栅格化 - 异步绘制之后会生成一张独立的图像 cell 在屏幕上滚动的时候,本质上是滚动这张图片,
        //cell优化, 要减少图层的数量, 相当于只有一层
        //停止滚动之后可以接收监听
        self.layer.shouldRasterize = true
        //使用`栅格化` 必须注意指定分辨率
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }    
}
