//
//  UILabel+Extensions.swift
//  EFPV2
//
//  Created by JayKong on 2018/3/29.
//  Copyright © 2018 JayKong. All rights reserved.
//

import Foundation
import UIKit

class UILabelPadding: UILabel {
    let padding = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, padding))
    }

    override var intrinsicContentSize: CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
}
