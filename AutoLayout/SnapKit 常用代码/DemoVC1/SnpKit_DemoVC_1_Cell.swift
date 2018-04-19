//
//  SnpKit_DemoVC_1_Cell.swift
//  AutoLayout
//
//  Created by yuency on 19/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit

class SnpKit_DemoVC_1_Cell: UITableViewCell {
    
    static let resuseId = "SnpKit_DemoVC_1_Cell"
    
    let leftTitleLabel: UILabel = {
        var v = UILabel()
        v.font = UIFont.systemFont(ofSize: 16)
        v.textColor = UIColor.red
        v.backgroundColor = UIColor.yellow
        v.text = "leftTitleLabel"
        return v
    }()

    
    let rightTitleLabel: UILabel = {
        var v = UILabel()
        v.font = UIFont.systemFont(ofSize: 16)
        v.textColor = UIColor.black
        v.backgroundColor = UIColor.green
        v.text = "rightTitleLabel"
        
        // 别拉伸我，谢谢(这就是右边label优先宽度自适应的关键代码)  优先级越高,越不容易被 拉伸!  (默认 251)
        v.setContentHuggingPriority(UILayoutPriority(1000), for: .horizontal)
        
        // 别压缩我,  优先级越高, 越不容易被 压缩!                                        (默认 750)
        v.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        
        return v
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.randomColor.withAlphaComponent(0.3)
        
        contentView.addSubview(leftTitleLabel)
        contentView.addSubview(rightTitleLabel)
        
        leftTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        rightTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(leftTitleLabel)
            make.right.equalToSuperview().offset(-20)
            make.left.equalTo(leftTitleLabel.snp.right).offset(20)
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
