//
//  DemoVC11.swift
//  AutoLayout
//
//  Created by yuency on 18/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class DemoVC11: UITableViewController {
    
    /// 数组
    var dataArray = Array<SDChatModel>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupDataWithCount(30)
        
        tableView.separatorStyle = .none
        
    }
    
    
    
    private func setupDataWithCount(_ count: Int) {
        
        for _ in 0..<count {
            
            let model = SDChatModel()
            
            let random: UInt32 = arc4random_uniform(2)
            
            if random == 1 {
                
                model.messageType = .SDMessageTypeSendToOthers
                model.iconName = SDAnalogDataGenerator.randomIconImageName()
                if arc4random_uniform(10) > 5 {
                    let index = arc4random_uniform(5)
                    model.imageName = "test\(index).jpg"
                }
                
            } else {
                
                model.messageType = .SDMessageTypeSendToMe
                model.iconName = "2.jpg"
                if arc4random_uniform(10) < 5 {
                    let index = arc4random_uniform(5)
                    model.imageName = "test\(index).jpg"
                }
                
            }
            
            model.text = SDAnalogDataGenerator.randomName()
            dataArray.append(model)
        }
    }
    
    
    //MARK: - 表格代理函数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
