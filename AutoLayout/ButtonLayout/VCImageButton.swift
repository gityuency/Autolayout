//
//  VCImageButton.swift
//  AutoLayout
//
//  Created by yuency on 14/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit


/*
 这个按钮做的并不好, 有很多的问题. 当前的这个样子只是满足了我的项目需求而已. 不能说是一个完美的方案
 */
class VCImageButton: UIViewController {
    
    ///按钮啊
    private let choseChinaBtn = NationButton(title: "阳光在身上流转,等所有业障被原谅", image: UIImage(named: "btn_china"), target: self, action: #selector(selectedNation))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.sd_addSubviews([choseChinaBtn])
        
        //布局
        _ = choseChinaBtn.sd_layout().centerYEqualToView(view)?.centerXEqualToView(view)?.widthIs(100)?.heightIs(200)
    }
    

    @objc private func selectedNation(btn: NationButton) {
        
    }
    
}


// MARK: - 上面图片,下面文字的按钮 使用了 SDAutoLayout 布局
// 当高度不够的时候,压缩的是按钮的文字
class NationButton :UIButton {
    
    /// 初始化
    convenience init(title: String, image: UIImage?, target: Any?, action: Selector) {
        self.init()
        
        setTitle(title, for: .normal)
        setTitleColor(UIColor.red, for: .normal)
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleAspectFit
        titleLabel?.textAlignment = .center
        addTarget(target, action: action, for: .touchUpInside)
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
        titleLabel?.numberOfLines = 0
        
        backgroundColor = UIColor.lightGray
        titleLabel?.backgroundColor = UIColor.yellow
        imageView?.backgroundColor = UIColor.brown
    }
    
    /// 重写按钮图片和文字布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let imageView = imageView, let titleLabel = titleLabel else {
            return
        }
       
        /* 使用苹果原生的约束没有写出效果.还是太年轻了 "感情是用来浏览还是用来珍藏" */
        _ =  imageView.sd_layout().topEqualToView(self)?.centerXEqualToView(self)?.widthRatioToView(self, 1.0)?.heightEqualToWidth()
        _ = titleLabel.sd_layout().topSpaceToView(imageView, 0)?.leftEqualToView(self)?.rightEqualToView(self)?.bottomEqualToView(self)
    }
}
