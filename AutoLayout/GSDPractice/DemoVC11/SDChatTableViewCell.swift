//
//  SDChatTableViewCell.swift
//  AutoLayout
//
//  Created by yuency on 18/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class SDChatTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    

    
    var chatModel: SDChatModel? {
        didSet{
            
        }
    }

}


