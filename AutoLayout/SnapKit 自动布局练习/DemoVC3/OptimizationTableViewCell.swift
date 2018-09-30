//
//  OptimizationTableViewCell.swift
//  AutoLayout
//
//  Created by yuency on 17/05/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit
import QuartzCore

class OptimizationTableViewCell: UITableViewCell {
    
    static let resuseId = "OptimizationTableViewCell"
    
    let nameLabel: UILabel = {
        var v = UILabel()
        v.font = UIFont.systemFont(ofSize: 18)
        v.textColor = UIColor.black
        v.text = "nameLabel"
        
        /*
         v.layer.masksToBounds = false;
         v.layer.shadowRadius  = 5.0;
         v.layer.shadowColor = UIColor.black.cgColor
         v.layer.shadowOffset  = CGSize(width: 2, height: 2)
         v.layer.shadowOpacity = 1;
         */
        /* 传说中的给阴影设置 path, 消除离屏渲染 这个需要获得大小 */
        //v.layer.shadowPath = UIBezierPath.init(rect: v.bounds).cgPath
        
        return v
    }()
    
    let contentLabel: UILabel = {
        var v = UILabel()
        v.font = UIFont.systemFont(ofSize: 14)
        v.textColor = UIColor.gray
        v.numberOfLines = 0
        v.text = "contentLabel"
        return v
    }()
    
    let headImageView: UIImageView = {
        let v = UIImageView()
        //v.contentMode = .scaleAspectFill 这句话会导致离屏渲染, 被标记为黄色
        v.layer.cornerRadius = 30
        v.layer.masksToBounds = true
        return v
    }()
    
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.randomColor.withAlphaComponent(0.1)
        
        //optimizationCell()
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(headImageView)
        
        headImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
            make.height.width.equalTo(60)
            make.bottom.lessThanOrEqualToSuperview().offset(-20).priority(.low)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(headImageView.snp.right).offset(20)
            make.top.equalToSuperview().offset(20)
            make.right.lessThanOrEqualToSuperview().offset(-20)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.right.lessThanOrEqualToSuperview().offset(-20)
            make.bottom.lessThanOrEqualToSuperview().offset(-20)
        }
        
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
