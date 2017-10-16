//
//  DemoVC7Cell2.swift
//  AutoLayout
//
//  Created by yuency on 22/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class DemoVC7Cell2: UITableViewCell {
    
    
    var model: DemoVC7Model? {
        
        didSet{
            
            titleLabel.text = model?.title
            
            for (index, value) in (model?.imagePathsArray?.enumerated())! {
                let imageView = imageViewsArray[index]
                imageView.image = UIImage(named: value);
            }
        }
    }
    
    //标题
    let titleLabel = UILabel()
    //
    var imageViewsArray = Array<UIImageView>()
    
    
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
        
        setup();
        
        
    }
    
    //设置页面
    private func setup() {
       
        contentView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.darkGray
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        let imageView1 = UIImageView()
        contentView.addSubview(imageView1)
        
        let imageView2 = UIImageView()
        contentView.addSubview(imageView2)
        
        let imageView3 = UIImageView()
        contentView.addSubview(imageView3)
        
        imageView1.layer.borderColor = UIColor.gray.cgColor
        imageView1.layer.borderWidth = 1
        imageView2.layer.borderColor = UIColor.gray.cgColor
        imageView2.layer.borderWidth = 1
        imageView3.layer.borderColor = UIColor.gray.cgColor
        imageView3.layer.borderWidth = 1
        
        imageViewsArray = [imageView1, imageView2, imageView3];
        
        //设置等宽的子 view
        contentView.sd_equalWidthSubviews = imageViewsArray
        
        let margin: CGFloat = 15
        
        _ = titleLabel.sd_layout().leftSpaceToView(contentView, margin)?.topSpaceToView(contentView, margin)?.rightSpaceToView(contentView, margin)?.autoHeightRatio(0)

        _ = imageView1.sd_layout().topSpaceToView(titleLabel, margin)?.leftSpaceToView(contentView, margin)?.autoHeightRatio(0.8);
        
        _ = imageView2.sd_layout().topSpaceToView(titleLabel, margin)?.leftSpaceToView(imageView1, margin)?.autoHeightRatio(0.8)
        
        _ = imageView3.sd_layout().topSpaceToView(titleLabel, margin)?.leftSpaceToView(imageView2, margin)?.rightSpaceToView(contentView, margin)?.autoHeightRatio(0.8)
        
        setupAutoHeight(withBottomView: imageView1, bottomMargin: margin)
    }
}
