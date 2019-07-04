//
//  ExampleCodeCell.swift
//  AutoLayout
//
//  Created by EF on 2019/7/4.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit

class ExampleCodeCell: UICollectionViewCell {
 
    static let reuseId = "ExampleCodeCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.magenta
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
