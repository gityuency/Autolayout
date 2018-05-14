//
//  DemoVC8.swift
//  AutoLayout
//
//  Created by yuency on 16/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit


private let DemoVC8_cell_ID_1 = "DemoVC8_cell_ID_1"

private let DemoVC8_cell_ID_2 = "DemoVC8_cell_ID_2"


class DemoVC8: UITableViewController {
    
    //模型数组
    var modelsArray = Array<DemoVC7Model>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatModelsWith(count: 18)
        
        tableView.register(DemoVC7Cell1.self, forCellReuseIdentifier: DemoVC8_cell_ID_1)
        
        tableView.register(DemoVC7Cell2.self, forCellReuseIdentifier: DemoVC8_cell_ID_2)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = modelsArray[indexPath.row]
        
        if let count = model.imagePathsArray?.count, count > 1 {
            
            
            // 这里使用的是 cell 的升级版的高度缓存方案, 所以这里不能写带有 for: indexPath 的取 cell id 的方法, 会报错
            //let cell = tableView.dequeueReusableCell(withIdentifier: DemoVC7Cell1ID, for: indexPath) as! DemoVC7Cell1
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DemoVC8_cell_ID_2) as! DemoVC7Cell2
            cell.model = model
            cell.useCellFrameCache(with: indexPath, tableView: tableView)
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DemoVC8_cell_ID_1) as! DemoVC7Cell1
            cell.model = model
            cell.useCellFrameCache(with: indexPath, tableView: tableView)
            
            return cell
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //旧版方法
        //        let model = modelsArray[indexPath.row]
        let width = UIScreen.main.bounds.size.width
        //        if let count = model.imagePathsArray?.count, count > 1 {
        //            return tableView.cellHeight(for: indexPath, model: model, keyPath: "model", cellClass: DemoVC7Cell2.self, contentViewWidth: width)
        //        } else {
        //            return tableView.cellHeight(for: indexPath, model: model, keyPath: "model", cellClass: DemoVC7Cell1.self, contentViewWidth: width)
        //        }
        
        //升级版的方法
        return cellHeight(for: indexPath, cellContentViewWidth: width)
        
    }
    
    
    
    
    //MARK: - 创建模型
    private func creatModelsWith(count: Int) {
        
        let iconImageNamesArray = ["icon0.jpg",
                                   "icon1.jpg",
                                   "icon2.jpg",
                                   "icon3.jpg",
                                   "icon4.jpg",
                                   ];
        
        
        let textArray = ["当你的 app 没有提供 3x 的LaunchImage 时。然后等比例拉伸",
                         "然后等比例拉伸到大屏。屏幕宽度返回 320否则在大屏上会显得字大",
                         "长期处于这种模式下，否则在大屏上会显得字大，内容少这种情况下对界面不会",
                         "但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                         "屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任小。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                         ];
        
        
        for _ in 0..<count {
            
            let iconRandomIndex = Int(arc4random_uniform(5))
            let nameRandomIndex = Int(arc4random_uniform(5))
            
            let model = DemoVC7Model()
            model.title = textArray[nameRandomIndex]
            
            //模拟有无图片
            let random = Int(arc4random_uniform(100))
            if random <= 30 {
                
                var temp = Array<String>()
                
                for _ in 0..<3 {
                    
                    let randomIndex = Int(arc4random_uniform(5))
                    let text =  iconImageNamesArray[randomIndex]
                    temp.append(text)
                }
                model.imagePathsArray = temp
                
            } else {
                model.imagePathsArray = [iconImageNamesArray[iconRandomIndex]]
            }
            modelsArray.append(model)
        }
        
    }
    
    
    
    
}
