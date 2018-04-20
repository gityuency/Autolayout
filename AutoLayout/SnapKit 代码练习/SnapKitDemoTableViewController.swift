//
//  SnapKitDemoTableViewController.swift
//  AutoLayout
//
//  Created by yuency on 19/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit
import SnapKit
/// cell 重用标示
private let cellidSnapKitPracticeList = "SnapKitDemoTableViewController"

class SnapKitDemoTableViewController: UITableViewController {
    
    
    let listArray = [
        ["SnpKitDemoVC0":"1. 头像始终在 cell 纵向居中 \n2. 标题标签始终在纵向中心线的上方 \n3.标签始终在纵向中心线的下方 \n4. Section的高度是固定高度"],
        ["SnpKitDemoVC1":"1. 两个 Label 在 cell 中水平居中 \n2. 两个 Label 的宽度都随文字长短变化 \n3.右边的 Label 优先完整显示内容, 不能被压缩, 不能被拉伸"],
        ["SnpKitDemoVC2":"1. 一个ImageView, 两个 Label \n2. 头像宽高固定, 左,上距离固定 \n3. NameLabel 只显示一行 宽度随文字变化 \n4. ContentLabel 显示多行 宽度和高度都随着文字变化 \n5. 无论是否有 Content, cell 底部距离最靠近它的高度的控件(可能是ImageView, 可能是ContentLabel)为 20"],

        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SnapKit 三方库的练习"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellidSnapKitPracticeList)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellidSnapKitPracticeList, for: indexPath)
        //使用字典的值作为标题
        cell.textLabel?.text = "介绍 ->\n\(Array(listArray[indexPath.row].values)[0])"
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage.init(named: "jinshuo")
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
