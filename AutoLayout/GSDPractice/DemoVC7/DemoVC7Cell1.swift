//
//  DemoVC7Cell1.swift
//  AutoLayout
//
//  Created by yuency on 22/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class DemoVC7Cell1: UITableViewCell {
    
    var model: DemoVC7Model?
    
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
        super.init(style: style, reuseIdentifier: reuseIdentifier
        )
    }
    
    
}
