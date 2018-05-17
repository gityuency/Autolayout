//
//  OptimizationTableViewCell.swift
//  AutoLayout
//
//  Created by yuency on 17/05/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit

class OptimizationTableViewCell: UITableViewCell {
    
    static let resuseId = "OptimizationTableViewCell"
    
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
        
        self.backgroundColor = UIColor.randomColor.withAlphaComponent(0.3)
        
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
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
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
