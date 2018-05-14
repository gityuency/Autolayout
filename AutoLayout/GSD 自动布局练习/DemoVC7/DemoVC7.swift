//
//  DemoVC7.swift
//  AutoLayout
//
//  Created by yuency on 22/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit
import MJRefresh

private let DemoVC7Cell1ID = "DemoVC7Cell1ID"

private let DemoVC7Cell2ID = "DemoVC7Cell2ID"


class DemoVC7: UITableViewController {
    
    //数组模型
    var modelsArray = Array<DemoVC7Model>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatModelsWith(count: 10)
        
        tableView.register(DemoVC7Cell1.self, forCellReuseIdentifier: DemoVC7Cell1ID)
        tableView.register(DemoVC7Cell2.self, forCellReuseIdentifier: DemoVC7Cell2ID)
        tableView.tableFooterView = UIView() //去掉多余的分割线
        
        //李明杰上拉加载的正确姿势
        let header = MJRefreshNormalHeader {
            let when = DispatchTime.now() + 1
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.modelsArray.removeAll()
                self.creatModelsWith(count: 3)
                self.tableView.reloadData()
                self.tableView.mj_header.endRefreshing()
            })
        }
        tableView.mj_header = header;
        
        
        //李明杰下拉加载的正确姿势
        let footer = MJRefreshAutoNormalFooter {
            let when = DispatchTime.now() + 1
            DispatchQueue.main.asyncAfter(deadline: when, execute: {
                self.creatModelsWith(count: 2)
                self.tableView.reloadData()
                self.tableView.mj_footer.endRefreshing()
            })
        }
        tableView.mj_footer = footer
        footer?.triggerAutomaticallyRefreshPercent = 0.2
        footer?.isAutomaticallyHidden = true
    }
    
    
    
    //MARK: - 表格代理
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //BSD basement software development
        let model = modelsArray[indexPath.row]
        
        if let count = model.imagePathsArray?.count, count > 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DemoVC7Cell2ID, for: indexPath) as! DemoVC7Cell2
            cell.model = model
            cell.useCellFrameCache(with: indexPath, tableView: tableView)
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DemoVC7Cell1ID, for: indexPath) as! DemoVC7Cell1
            cell.model = model
            cell.useCellFrameCache(with: indexPath, tableView: tableView)
            
            return cell
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = modelsArray[indexPath.row]
        
        let width = UIScreen.main.bounds.size.width
        
        if let count = model.imagePathsArray?.count, count > 1 {
            
            return tableView.cellHeight(for: indexPath, model: model, keyPath: "model", cellClass: DemoVC7Cell2.self, contentViewWidth: width)
        } else {
            
            return tableView.cellHeight(for: indexPath, model: model, keyPath: "model", cellClass: DemoVC7Cell1.self, contentViewWidth: width)
        }
    }
    
    
    
    //MARK: - 创建模型
    func creatModelsWith(count: Int) {
        
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

