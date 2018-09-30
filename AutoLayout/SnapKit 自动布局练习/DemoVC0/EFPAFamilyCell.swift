//
//  EFPAFamilyCell.swift
//  EFPV2
//
//  Created by EF on 28/01/2019.
//  Copyright © 2019 比利海灵顿. All rights reserved.
//

import UIKit

class EFPAFamilyCell: UITableViewCell {
    static let resuseId = "EFPAFamilyCell"
    
    let nameLabel: UILabel = {
        var v = UILabel()
        v.font = UIFont.systemFont(ofSize: 16)
        v.textColor = UIColor.red
        v.numberOfLines = 0
        v.backgroundColor = UIColor.yellow
        v.text = "No Family Name"
        return v
    }()
    
    let headImageView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 25
        return v
    }()
    
    let containerView: UIView = {
        let v = UIView()
        //v.backgroundColor = UIColor.orange
        return v
    }()
    
    let tipLabel: UILabelPadding = {
        var v = UILabelPadding()
        let col = UIColor.purple
        v.font = UIFont.systemFont(ofSize: 10)
        v.textColor = col
        v.layer.borderColor = col.cgColor
        v.layer.borderWidth = 0.5
        v.layer.cornerRadius = 4
        v.layer.masksToBounds = true
        v.text = "No Tag"
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.randomColor.withAlphaComponent(0.3)
        
        contentView.addSubview(containerView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(tipLabel)
        containerView.addSubview(headImageView)
        
        containerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            
            make.width.equalTo(80)
            make.height.equalToSuperview()
        }
        
        headImageView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        // cell 的高度由 nameLabel tipLabel 的高度共同确定
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(containerView.snp.right)
            make.top.equalToSuperview().offset(20)
            make.right.lessThanOrEqualToSuperview().offset(-20)
            make.bottom.lessThanOrEqualTo(contentView.snp.centerY).offset(-10)
            
        }
        
        tipLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel)
            make.right.lessThanOrEqualTo(contentView).offset(-20)
            make.top.equalTo(contentView.snp.centerY).offset(5)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-20)
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

protocol EFPAFamilyHeaderCloseProtocol: class {
    func didCloseGroup(section: Int, header: EFPAFamilyHeader)
}

class EFPAFamilyHeader: UITableViewHeaderFooterView {
    
    static let resuseId = "EFPAFamilyHeader"
    
    let arrowImgeView: UIImageView = {
        let v = UIImageView()
        return v
    }()
    
    let nameLabel: UILabel = {
        var v = UILabel()
        v.font = UIFont.systemFont(ofSize: 16)
        v.textColor = UIColor.black
        v.backgroundColor = UIColor.yellow
        v.text = "No Class"
        return v
    }()
    
    let leftbutton: UIButton = {
        let v = UIButton()
        v.backgroundColor = UIColor.brown
        return v
    }()
    
    var section: Int = 0
    
    var closed = false {
        didSet {
            if closed {
                self.arrowImgeView.transform = CGAffineTransform.identity
            } else {
                self.arrowImgeView.transform = CGAffineTransform(rotationAngle: CGFloat.pi - 0.001)
            }
        }
    }
    
    weak var delegate: EFPAFamilyHeaderCloseProtocol?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(leftbutton)
        leftbutton.addSubview(arrowImgeView)
        
        leftbutton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20).priority(.high)
            make.bottom.equalToSuperview().offset(-20).priority(.high)
            make.height.width.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(leftbutton)
            make.left.equalTo(leftbutton.snp.right).offset(20)
        }
        
        leftbutton.addTarget(self, action: #selector(closeGroup), for: .touchUpInside)
    }
    
    @objc func closeGroup() {
        delegate?.didCloseGroup(section: section, header: self)
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
