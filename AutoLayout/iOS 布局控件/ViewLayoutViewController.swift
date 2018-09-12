//
//  ViewLayoutViewController.swift
//  AutoLayout
//
//  Created by yuency on 14/05/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit

/// cell 重用标示
private let cellidViewLayoutViewController = "cellidViewLayoutViewController"


class ViewLayoutViewController: UITableViewController {

    
    let listArray = [
        ["SearchResultDisplayViewController": "将搜索文本在一个 Label 上动态显示"],
        ["DynamicUILabelViewController": "iOS10 字体大小随系统调整"],
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "iOS 布局控件"
        tableView.estimatedRowHeight = 150;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellidViewLayoutViewController)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellidViewLayoutViewController, for: indexPath)
        cell.textLabel?.text = "\(Array(listArray[indexPath.row].values)[0])"
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage.init(named: "liulu")
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
