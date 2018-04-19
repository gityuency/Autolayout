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
        cell.textLabel?.text = "\(indexPath.row) ->\n\(Array(listArray[indexPath.row].values)[0])"
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
