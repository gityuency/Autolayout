//
//  GSDPracticeTableViewController.swift
//  AutoLayout
//
//  Created by yuency on 15/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

/// cell 重用标示
private let cellidGSDPracticeList = "GSDPracticeTableViewController"

class GSDPracticeTableViewController: UITableViewController {
    
    
    let listArray = [
        ["DemoVC0":"VC0 自动布局的动画,修改一个 View 布局的约束,其他的 View 会自动重新排布"],
        ["DemoVC1":"VC1 设置 View1的高度根据子 View 而适应,(在 View1中加入两个子 View, testLabel和 testView 然后色设置 view1高度根据子 view 内容自适应) \n2.高度自适应 Label \n3.宽度自适应 Label"],
        ["DemoVC2":"VC2 1.自定义 Button 内部 Label 和 imageVie 的位置, \n2.设置间距固定自动调整宽度的一组子 View \n3.设置宽度固定自动调整间距的一组子 View"],
        ["DemoVC3":"简单 TableView 高度自适应 示例代码"],
        ["DemoVC4":"行间距为 8 的 AttributeString 的 Label"],
        ["DemoVC5":"1.利用普通 View 的内容自适应功能添加 tableViewHeaderView \n2.利用自动布局功能实现 cell 内部图文排布,图片可以根据原始尺寸按比例缩放后展示 \n3.利用 普通版本 TableView 的cell 高度自适应 完成 tableviewcell 的排布 "],

        ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "自动布局三方库的练习"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellidGSDPracticeList)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellidGSDPracticeList, for: indexPath)
        
        //使用字典的值作为标题
        cell.textLabel?.text = "\(indexPath.row): \(Array(listArray[indexPath.row].values)[0])"
        
        return cell
    }
    
    
    //MARK: - 事件
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //因为字典的 key 就是将要 push 进来的控制器的名字
        let vcName = Array(listArray[indexPath.row].keys)[0]
        
        //把这个 key 转换成为类 需要加上命名空间前缀,否则不生效
        if let cls = NSClassFromString(Bundle.main.nameSpaceStirng + "." + vcName) as? UIViewController.Type {
            let vc = cls.init()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
