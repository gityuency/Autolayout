//
//  ThreeBaseCell.swift
//  AutoLayout
//
//  Created by yuency on 16/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit
import SDCycleScrollView
//import NightNight

class ThreeBaseCell: UITableViewCell, SDCycleScrollViewDelegate {
    
    
    /**
     *  图片
     */
    var imgIcon = UIImageView()
    
    
    /**
     *  标题
     */
    var lblTitle = UILabel()
    
    /**
     *  描述
     */
    var lblSubtitle = UILabel()
    
    
    /**
     *  第二张图片（如果有的话）
     */
    var imgOther1 = UIImageView()
    
    
    /**
     *  第三张图片（如果有的话）
     */
    var imgOther2 = UIImageView()
    
    
    /**
     *  底部分界线
     */
    var lineView = UIImageView()
    
    
    /**
     *  滚动图片区
     */
    var cycleScrollView: SDCycleScrollView?
    
    
    // 数据模型
    var threeModel: ThreeModel?
    
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.addSubview(imgIcon)

        lblTitle.font = UIFont.systemFont(ofSize: 15)
        lblTitle.numberOfLines = 0
        contentView.addSubview(lblTitle)

        lblSubtitle.textColor = UIColor.gray
        lblSubtitle.font = UIFont.systemFont(ofSize: 13)
        lblSubtitle.numberOfLines = 0
        contentView.addSubview(lblSubtitle)

        contentView.addSubview(lineView)
    
        contentView.addSubview(imgOther1)

        contentView.addSubview(imgOther2)
        
        //设置主题

//        lblTitle.mixedTextColor =  MixedColor(normal: day_demovc11_textcolor, night: night_demovc11_textcolor)
//        lblSubtitle.mixedTextColor =  MixedColor(normal: day_demovc10_cell_summarycolor, night: night_demovc10_cell_summarycolor)
//        lineView.mixedBackgroundColor = MixedColor(normal: day_demovc10_cell_separatorcolor, night: night_demovc10_cell_separatorcolor)
//        contentView.mixedBackgroundColor = MixedColor(normal: day_demovc10_cell_backgroundcolor, night: night_demovc10_cell_backgroundcolor)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}




//
//let day_demovc11_backgroundcolor: Int = 0xfafafa

let day_demovc11_textcolor: Int = 0x333333

let day_demovc10_cell_backgroundcolor: Int = 0xEEEEEE

//let day_demovc10_cell_titlecolor: Int = 0xff444444

let day_demovc10_cell_separatorcolor: Int = 0x666666

let day_demovc10_cell_summarycolor: Int = 0x666666

//let day_demovc10_cell_linecolor: Int = 0x666666

//let day_demovc10_backgroundcolor: Int = 0xfffafafa


//
//let night_demovc11_backgroundcolor: Int = 0x000000

let night_demovc11_textcolor: Int = 0x999999

let night_demovc10_cell_backgroundcolor: Int = 0x111111

//let night_demovc10_cell_titlecolor: Int = 0xff8B8B8B

let night_demovc10_cell_separatorcolor: Int = 0xeeeeee

let night_demovc10_cell_summarycolor: Int = 0x666666

//let night_demovc10_cell_linecolor: Int = 0xeeeeee

//let night_demovc10_backgroundcolor: Int = 0xff1c1c1c





//白天
//{
//    "color": {
//        "demovc11_backgroundcolor": "#fafafa",
//        "demovc11_textcolor": "#333333",
//
//        "demovc10_cell_backgroundcolor": "#fffafafa",
//        "demovc10_cell_titlecolor": "#ff444444",
//        "demovc10_cell_separatorcolor": "#ffD9D9D9",
//        "demovc10_cell_summarycolor": "#ff686868",
//        "demovc10_cell_linecolor": "#ffD9D9D9",
//        "demovc10_backgroundcolor": "#fffafafa"
//    },
//    "image": {
//        "messageimage": ""
//    }
//}


//夜晚
//{
//    "color": {
//        "demovc11_backgroundcolor": "#000000",
//        "demovc11_textcolor": "#555555",
//
//        "demovc10_cell_backgroundcolor": "#ff222222",
//        "demovc10_cell_titlecolor": "#ff8B8B8B",
//        "demovc10_cell_separatorcolor": "#ff2f2f2f",
//        "demovc10_cell_summarycolor": "#ff686868",
//        "demovc10_cell_linecolor": "#ff2f2f2f",
//        "demovc10_backgroundcolor": "#ff1c1c1c"
//    },
//    "image": {
//        "messageimage": ""
//    }
//}



