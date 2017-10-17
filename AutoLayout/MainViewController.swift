//
//  MainViewController.swift
//  AutoLayout
//
//  Created by yuency on 14/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit
import SDAutoLayout
import LEETheme
import Alamofire
import YYModel

/// cell 重用标示
let cellid = "shilidaima"


class MainViewController: UIViewController {
    
    //MARK: - 属性组
    let tableView = UITableView()
    
    let listArray = [
        ["ViewControllerButtonList":"按钮组"],
        ["ViewControllerLabelList":"标签组"],
        ["GSDPracticeTableViewController": "GSD 自动布局练习"],
        ]
    
    
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置页面
        setUpView()
    }
    
    
    /// 设置页面
    private func setUpView() {
        self.title = "自动布局示例代码"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //注册 cell 重用的正确姿势
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
        
        view.sd_addSubviews([tableView])
        
        _ = tableView.sd_layout().topEqualToView(view)?.rightEqualToView(view)?.bottomEqualToView(view)?.leftEqualToView(view)
        
    }
}


// MARK: - 实现表格的协议方法
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: -  数据源
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
        
        //使用字典的值作为标题
        cell.textLabel?.text = "\(indexPath.row): \(Array(listArray[indexPath.row].values)[0])"
        return cell
    }
    
    //MARK: - 事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //因为字典的 key 就是将要 push 进来的控制器的名字
        let vcName = Array(listArray[indexPath.row].keys)[0]
        
        //把这个 key 转换成为类 需要加上命名空间前缀,否则不生效
        if let cls = NSClassFromString(Bundle.main.nameSpaceStirng + "." + vcName) as? UIViewController.Type {
            let vc = cls.init()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}













