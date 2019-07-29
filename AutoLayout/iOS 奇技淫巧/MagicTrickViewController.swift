//
//  MagicTrickViewController.swift
//  AutoLayout
//
//  Created by yuency on 17/05/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit

private let cellidMagicTrickViewController = "cellidMagicTrickViewController"


class MagicTrickViewController: UITableViewController {

    let listArray = [
        ["ContentSiseViewController": "制作带有内容尺寸(宽高)的控件"],
        ["CornerViewController": "画圆角 部分圆角 指定位置圆角"],
        ["iOS10UserNotificationViewController": "iOS 10 新特性 本地通知"],
        ["iOS10TabbarViewController": "iOS 10 Tabbar 定制"],
        ["iOS10SpeechViewController": "iOS 10 新特性 语音识别"],
        ["iOS10PullRefreshViewController": "iOS 10 新特性 下拉刷新控件 支持 UIScrollView 以及其所有子类"],
        ["iOS10AnimationViewController": "iOS 10 新特性 属性动画器"],
        ["Magic_0_ViewController": "在字符串中提取汉字, 相邻的汉字不拆分, 把这些汉字放到数组"],
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "iOS 奇技淫巧"
        tableView.estimatedRowHeight = 150;
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellidMagicTrickViewController)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellidMagicTrickViewController, for: indexPath)
        cell.textLabel?.text = "\(Array(listArray[indexPath.row].values)[0])"
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage.init(named: "jinshuo")
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcName = Array(listArray[indexPath.row].keys)[0]
        if let cls = NSClassFromString(Bundle.main.nameSpaceStirng + "." + vcName) as? UIViewController.Type {
            let vc = cls.init()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
  

}
