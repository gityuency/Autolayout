//
//  VCUnderLineButton.swift
//  AutoLayout
//
//  Created by yuency on 14/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class VCUnderLineButton: UIViewController {

    let buttonX = UIButton(type: UIButton.ButtonType.custom)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        buttonX.backgroundColor = UIColor.brown
        
        view.sd_addSubviews([buttonX])
        
        _ = buttonX.sd_layout().centerXEqualToView(view)?.centerYEqualToView(view)?.heightIs(60)?.widthIs(200)
        
        let str = "去注册"
        let attributedString = NSMutableAttributedString(string:"")
        let attrs = [NSAttributedString.Key.foregroundColor.rawValue :UIColor.black,
                     NSAttributedString.Key.underlineStyle :1] as! [NSAttributedString.Key :Any]
        let sssetstr = NSMutableAttributedString.init(string: str, attributes: attrs)
        
        attributedString.append(sssetstr)
        buttonX.setAttributedTitle(attributedString, for: .normal)

    }

  
}
