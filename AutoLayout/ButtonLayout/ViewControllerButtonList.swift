//
//  ViewControllerButtonList.swift
//  AutoLayout
//
//  Created by yuency on 14/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

/// cell 重用标示
let cellidButtonList = "ViewControllerButtonList"

class ViewControllerButtonList: UIViewController {

    //MARK: - 属性组
    let tableView = UITableView()
   
    
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
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
        cell.textLabel?.text = "按钮 \(indexPath.row): "
        return cell
    }
}





