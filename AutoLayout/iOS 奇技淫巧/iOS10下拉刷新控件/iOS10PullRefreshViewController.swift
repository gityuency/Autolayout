//
//  iOS10PullRefreshViewController.swift
//  AutoLayout
//
//  Created by 去年的那个夏天 on 2018/9/10.
//  Copyright © 2018年 yuency. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)

/// iOS 10 下拉刷新控件 支持 UIScrollView 以及其所有子类 属性: refreshControl
class iOS10PullRefreshViewController: UIViewController {

    var scrollView: UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()


        // 初始化 scrollView
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        
        // 往scrollView里面添加一个有颜色的view
        let v = UIView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 1000))
        v.backgroundColor = UIColor.purple
        scrollView.addSubview(v)
        // 设置scrollView的滚动范围
        scrollView.contentSize = v.frame.size
        
        // 将scrollView添加到当前控制器的View中
        self.view.addSubview(scrollView)
        self.scrollView = scrollView
        
        
        // 添加下拉刷新控件
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        scrollView.refreshControl = refreshControl
    }
    
    @objc func refresh() {
        print("刷新事件执行了")
        
        // 延迟2秒之后结束刷新
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.scrollView?.refreshControl?.endRefreshing()
        }
        
    }

}
