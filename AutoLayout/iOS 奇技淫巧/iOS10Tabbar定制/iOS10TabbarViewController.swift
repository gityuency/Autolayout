//
//  iOS10TabbarViewController.swift
//  AutoLayout
//
//  Created by 去年的那个夏天 on 2018/9/10.
//  Copyright © 2018年 yuency. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)

class iOS10TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor.orange
        tabBar.unselectedItemTintColor = UIColor.magenta  //iOS 10
        addChildViewControllers()
        
    }

    /// 添加所有子控制器
    private func addChildViewControllers() {
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(UIViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(UIViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(UIViewController(), title: "我", imageName: "tabbar_profile")
    }

    /// 添加控制器
    ///
    /// - parameter vc       : 视图控制器
    /// - parameter title    : 标题
    /// - parameter imageName: 图像名称
    private func addChildViewController(_ vc: UIViewController, title: String, imageName: String) {
        //设置标题
        vc.title = title
        //设置图片
        vc.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "\(imageName)_selected")?.withRenderingMode(.alwaysOriginal)
        //使用导航控制器包裹起来
        let nav = UINavigationController(rootViewController: vc)
        addChild(nav)
    }

}



@available(iOS 10.0, *)

private class HomeTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // 设置 baged 的颜色
        tabBarItem.badgeColor = UIColor.green //iOS 10

        tabBarItem.badgeValue = "100"
        
        let textAttr: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
        ]
        tabBarItem.setBadgeTextAttributes(textAttr, for: [])
    }
}

