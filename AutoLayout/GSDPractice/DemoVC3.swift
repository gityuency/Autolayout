//
//  DemoVC3.swift
//  AutoLayout
//
//  Created by yuency on 20/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

private let ID = "fdsafdsafdsafdsa";


class DemoVC3: UITableViewController {
    
    /// 行数
    var rowCount: Int = 10
    
    var textArray = ["当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                     "然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                     "当你的 app 没有提供 3x 的 LaunchImage 时",
                     "但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                     "屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下，"
    ]
    
    
    var imageArray = ["a01.jpg","a02.jpg","a03.jpg","a04.jpg","a05.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TestCell2.self, forCellReuseIdentifier: ID)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row % 5
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ID, for: indexPath) as! TestCell2
        
        cell.mytext = textArray[index]
        cell.view0.image = UIImage(named: imageArray[index])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let index = indexPath.row % 5
        let str = textArray[index]
        
        return tableView.cellHeight(for: indexPath, model: str, keyPath: "mytext", cellClass: TestCell2.self, contentViewWidth: UIScreen.main.bounds.size.width)
        
    }
    
}
