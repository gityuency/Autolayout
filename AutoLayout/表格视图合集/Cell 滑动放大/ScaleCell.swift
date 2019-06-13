//
//  ScaleCell.swift
//  EF
//
//  Created by EF on 2019/5/30.
//  Copyright © 2019 EF. All rights reserved.
//

import UIKit

class ScaleCell: UICollectionViewCell {

    static let resuseid = "ScaleCell"

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
