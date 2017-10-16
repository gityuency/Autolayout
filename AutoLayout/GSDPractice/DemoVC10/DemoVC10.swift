//
//  DemoVC10.swift
//  AutoLayout
//
//  Created by yuency on 16/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class DemoVC10: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    ///表格
    lazy var tv: UITableView = {
        let tvView = UITableView(frame: self.view.bounds)
        tvView.separatorColor = UIColor.clear
        tvView.delegate = self
        tvView.dataSource = self
        tvView.backgroundColor = UIColor.clear
        return tvView
    }()
    
    ///数据列表
    var listArry = Array<Any>()
    
    ///翻页
    var page = 0
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
         */
        
        /*
         本demo日夜间主题切换由SDAutoLayout库的使用者“LEE”提供，感谢“LEE”对本库的关注与支持！
         */
        
        //LEETheme 分为两种模式 , 默认设置模式 标识符设置模式 , 朋友圈demo展示的是默认设置模式的使用 , 微信聊天demo和Demo10 展示的是标识符模式的使用
        
        
        automaticallyAdjustsScrollViewInsets = true
        view.addSubview(tv)
        tv.sd_layout().spaceToSuperView(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        
    }
    
    ///请求数据
    private func loadData() {
        
        let urlString = ""
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
    
    
    
    
}











//@objc private func rightBarButtonItemAction(sender: UIBarButtonItem) {
//
//
//}

//let rightBarButtonItem = UIBarButtonItem(title: "日间", style: .done, target: self, action: #selector(rightBarButtonItemAction(sender:)))
//
//self.navigationItem.rightBarButtonItem = rightBarButtonItem

