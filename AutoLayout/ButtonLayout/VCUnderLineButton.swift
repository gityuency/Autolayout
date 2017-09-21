//
//  VCUnderLineButton.swift
//  AutoLayout
//
//  Created by yuency on 14/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class VCUnderLineButton: UIViewController {

    let buttonX = UIButton(type: UIButtonType.custom)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        buttonX.backgroundColor = UIColor.brown
        
        view.sd_addSubviews([buttonX])
        
        _ = buttonX.sd_layout().centerXEqualToView(view)?.centerYEqualToView(view)?.heightIs(60)?.widthIs(200)
        
        let str = "去注册"
        let attributedString = NSMutableAttributedString(string:"")
        let attrs = [NSAttributedStringKey.foregroundColor.rawValue :UIColor.black,
                     NSAttributedStringKey.underlineStyle :1] as! [NSAttributedStringKey :Any]
        let sssetstr = NSMutableAttributedString.init(string: str, attributes: attrs)
        
        attributedString.append(sssetstr)
        buttonX.setAttributedTitle(attributedString, for: .normal)

    }

  
}
