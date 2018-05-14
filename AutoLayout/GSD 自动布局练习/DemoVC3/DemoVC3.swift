//
//  DemoVC3.swift
//  AutoLayout
//
//  Created by yuency on 20/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit
import MJRefresh
private let ID = "fdsafdsafdsafdsa";


class DemoVC3: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var textArray = ["当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                     "然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                     "当你的 app 没有提供 3x 的 LaunchImage 时",
                     "但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                     "屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下，"
    ]
    
    
    var imageArray = ["a01.jpg","a02.jpg","a03.jpg","a04.jpg","a05.jpg"]
    
    
    /// 表格
    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //如何正确删除数组里面的一组元素
        //self.textArray.removeSubrange(0...2)
        //self.imageArray.removeSubrange(0...2)
        
        //automaticallyAdjustsScrollViewInsets = false
        view.addSubview(tableView)
        
        _ = tableView.sd_layout().topSpaceToView(view, 0)?.leftEqualToView(view)?.rightEqualToView(view)?.bottomEqualToView(view)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView() //去掉多余的分割线
        tableView.register(TestCell2.self, forCellReuseIdentifier: ID)
        
        
        /// 李明杰下拉刷新的正确姿势
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(DemoVC3.headerRefresh))
        tableView.mj_header = header
        
        
        ///李明杰上拉加载的正确姿势
        let footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(DemoVC3.footerRefresh))
        tableView.mj_footer = footer
        footer?.triggerAutomaticallyRefreshPercent = 0.2
        footer?.isAutomaticallyHidden = true
        
    }
    
    //MARK: - 上拉刷新
    @objc func headerRefresh() {
        
        let when = DispatchTime.now() + 1
        
        DispatchQueue.main.asyncAfter(deadline: when, execute: {
            
            self.textArray.insert("新刷到的数据 \(when)", at: 0)
            self.imageArray.insert("e01.jpeg", at: 0)
            
            self.tableView.reloadData()
            
            self.tableView.mj_header.endRefreshing()
        })
    }
    
    
    //MARK: - 下拉加载
    @objc func footerRefresh() {
        
        let when = DispatchTime.now() + 1
        
        DispatchQueue.main.asyncAfter(deadline: when, execute: {
            
            self.textArray.append("加载到的数据 \(when)")
            self.imageArray.append("e02.jpeg")
            
            self.tableView.reloadData()
            
            self.tableView.mj_footer.endRefreshing()
        })
    }
    
    
    
    
    //MARK: - 表格代理函数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ID, for: indexPath) as! TestCell2
        
        cell.mytext = textArray[indexPath.row]
        cell.view0.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let str = textArray[indexPath.row]
        
        //***********************高度自适应cell设置步骤 2 ************************
        return tableView.cellHeight(for: indexPath, model: str, keyPath: "mytext", cellClass: TestCell2.self, contentViewWidth: UIScreen.main.bounds.size.width)
        
    }
    
    
}



//- (CGFloat)cellContentViewWith
//    {
//        CGFloat width = [UIScreen mainScreen].bounds.size.width;
//
//        // 适配ios7横屏
//        if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
//            width = [UIScreen mainScreen].bounds.size.height;
//        }
//        return width;
//}



