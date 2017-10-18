//
//  DemoVC10.swift
//  AutoLayout
//
//  Created by yuency on 16/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh
import NightNight

private let ThreeFirstCell_ID = "ThreeFirstCell_ID"
private let ThreeFourthCell_ID = "ThreeFourthCell_ID"
private let ThreeSecondCell_ID = "ThreeSecondCell_ID"
private let ThreeThirdCell_ID = "ThreeThirdCell_ID"

class DemoVC10: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    deinit {
        print("控制器,销毁了. DemoVC10 ")
    }
    
    
    var myRefreshView = MJRefreshComponent()
    
    ///表格
    lazy var tv: UITableView = {
        let tvView = UITableView(frame: self.view.bounds)
        tvView.separatorColor = UIColor.clear
        tvView.delegate = self
        tvView.dataSource = self
        tvView.mixedBackgroundColor = MixedColor(normal: 0xFECD52, night: 0xBDCDD2)
        
        tvView.register(ThreeFirstCell.self, forCellReuseIdentifier: ThreeFirstCell_ID)
        tvView.register(ThreeFourthCell.self, forCellReuseIdentifier: ThreeFourthCell_ID)
        tvView.register(ThreeSecondCell.self, forCellReuseIdentifier: ThreeSecondCell_ID)
        tvView.register(ThreeThirdCell.self, forCellReuseIdentifier: ThreeThirdCell_ID)
        
        
        //下拉刷新
        tvView.mj_header = MJRefreshNormalHeader { [weak self] in
            
            self?.myRefreshView = tvView.mj_header
            
            self?.page = 0
            self?.listArry.removeAll()
            self?.loadData()
        }
        
        //上拉加载
        tvView.mj_footer = MJRefreshAutoNormalFooter { [weak self] in
            
            self?.myRefreshView = tvView.mj_footer
            
            self?.page += 10
            self?.loadData()
        }
        
        return tvView
    }()
    
    
    ///数据列表
    var listArry = Array<ThreeModel>()
    
    ///翻页
    var page = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "网易新闻 DemoVC10"
        
        /*
         本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
         */
        
        /*
         本demo日夜间主题切换由SDAutoLayout库的使用者“LEE”提供，感谢“LEE”对本库的关注与支持！
         */
        
        //LEETheme 分为两种模式 , 默认设置模式 标识符设置模式 , 朋友圈demo展示的是默认设置模式的使用 , 微信聊天demo和Demo10 展示的是标识符模式的使用
        
        view.addSubview(tv)
        
        let rightBarButtonItem = UIBarButtonItem(title: "夜间", style: .done, target: self, action: #selector(rightBarButtonItemAction(sender:)))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        //导航栏整体设置
        navigationController?.navigationBar.mixedBarStyle = MixedBarStyle(normal: .default, night: .black)
        //导航栏的颜色
        navigationController?.navigationBar.mixedBarTintColor = MixedColor(normal: 0xffffff, night: 0xB72712)
        //设置左右各种 item 文字的颜色  在mixedBarStyle设置之后才会去改变导航栏上所有文字的颜色
        navigationController?.navigationBar.mixedTintColor = MixedColor(normal: 0x000000, night: 0xFFFFFF)
        
        //这里请求一次数据
        loadData()
    }
    
    
    @objc private func rightBarButtonItemAction(sender: UIBarButtonItem) {
        
        if NightNight.theme == .night {
            NightNight.theme = .normal
            sender.title = "夜间"
        } else {
            NightNight.theme = .night
            sender.title = "日间"
        }
    }
    
    
    ///请求数据
    private func loadData() {
        
        let urlString = "http://c.m.163.com/nc/article/headline/T1348647853363/\(self.page)-20.html"
        print("接口地址 \(urlString)")
        
        Alamofire.request(urlString).responseJSON { (json) in
            
            switch json.result {
                
            case .success:  //网络请求成功,解析网络
                
                //MARK: -  这绝对是一个重大的姿势调整!!!!!!!!
                // 顶部结点是一个数组, 从顶部结点拆分这些数据, 遍历数组制造模型
                
                if let topDic = json.result.value as? [String: Any] {
                    
                    //首先获取这个顶部结点的 key
                    let keyName = Array(topDic.keys)[0];
                    
                    //然后获取这个数组
                    let array = topDic[keyName] as? [Any];
                    
                    //遍历数组,对模型赋值
                    for dic in array ?? [] {
                        guard let model = ThreeModel.yy_model(withJSON: dic) else {
                            continue
                        }
                        self.listArry.append(model)
                    }
                }
                
                
                self.myRefreshView.endRefreshing()
                
                self.tv.reloadData()
                
            case .failure(let error):  //网络请求失败, 解析本地文件
                
                print("网络请求失败,解析本地文件 + \(error)")
            }
        }
        
        
        // Alamofire.request(urlString).responseString { (jsonstring) in
        //      print(jsonstring)
        // }
    }
    
    
    
    //MARK:-  表格代理函数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = listArry[indexPath.row]
        
        var cell: ThreeBaseCell;
        
        if model.hasHead == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: ThreeFourthCell_ID, for: indexPath) as! ThreeFourthCell
        } else if (model.imgextra?.count != nil) {
            cell = tableView.dequeueReusableCell(withIdentifier: ThreeSecondCell_ID, for: indexPath) as! ThreeSecondCell
        } else if (model.imgType == 1) {
            cell = tableView.dequeueReusableCell(withIdentifier: ThreeThirdCell_ID, for: indexPath) as! ThreeThirdCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: ThreeFirstCell_ID, for: indexPath) as! ThreeFirstCell
        }
        
        cell.threeModel = model
        
        
        ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
        cell.sd_tableView = tableView
        cell.sd_indexPath = indexPath
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = listArry[indexPath.row]
        
        if model.hasHead == 1 {
            return tv.cellHeight(for: indexPath, model: model, keyPath: "threeModel", cellClass: ThreeFourthCell.self, contentViewWidth: UIScreen.main.bounds.width)
        } else if (model.imgextra?.count != nil) {
            return tv.cellHeight(for: indexPath, model: model, keyPath: "threeModel", cellClass: ThreeSecondCell.self, contentViewWidth: UIScreen.main.bounds.width)
        } else if (model.imgType == 1) {
            return tv.cellHeight(for: indexPath, model: model, keyPath: "threeModel", cellClass: ThreeThirdCell.self, contentViewWidth: UIScreen.main.bounds.width)
        } else {
            return tv.cellHeight(for: indexPath, model: model, keyPath: "threeModel", cellClass: ThreeFirstCell.self, contentViewWidth: UIScreen.main.bounds.width)
        }
    }
}










