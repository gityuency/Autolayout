//
//  ViewControllerButtonList.swift
//  AutoLayout
//
//  Created by yuency on 14/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

/// cell 重用标示
private let cellidButtonList = "ViewControllerButtonList"

class ViewControllerButtonList: UIViewController {

    //MARK: - 属性组
    private let tableView = UITableView()
   
    let listArray = [
        ["VCImageButton":"带有图片和标题的按钮"],
        ["VCUnderLineButton":"按钮文字带下划线"],
        
        ]
    
    
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
extension ViewControllerButtonList: UITableViewDelegate, UITableViewDataSource {
    
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





