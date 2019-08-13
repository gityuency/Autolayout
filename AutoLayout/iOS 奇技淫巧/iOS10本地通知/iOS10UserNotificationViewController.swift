//
//  iOS10UserNotificationViewController.swift
//  AutoLayout
//
//  Created by 这是今年3,4月份没有完成的一个,Story. on 2018/9/10.
//  Copyright © 2018年 yuency. All rights reserved.
//

import UIKit
import UserNotifications

//有自定义通知界面的讲解
//https://www.jianshu.com/p/5713fa2bfece

/// 通知的 Category 需要一个 ID
private let categoryid = "categoryid"

@available(iOS 10.0, *)
class iOS10UserNotificationViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    deinit {
        printLog("销毁了..")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    let b = UIButton();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        b.frame = view.bounds
        b.setTitle("点击按钮发送通知🔔", for: .normal)
        b.setTitleColor(UIColor.red, for: .normal)
        b.addTarget(self, action: #selector(send(button:)), for: .touchUpInside)
        view.addSubview(b)
        

        
        // 1. 注册通知权限
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound, .carPlay]) { (success, error) in
            print("iOS 10+ 通知授权" + (success ? "成功" : "失败"))
        }
        
        // 2. 设置交互
        let replayAction = UNTextInputNotificationAction(identifier: "replayAction", title: "立即回复", options: [])
        let enterAction = UNNotificationAction(identifier:"enterAction",title: "进入会话",options: .foreground)
        let stopAction = UNNotificationAction(identifier:"stopAction",title: "关闭",options: .destructive)
        let categroy = UNNotificationCategory(identifier: categoryid,actions: [replayAction, enterAction, stopAction],intentIdentifiers: [],options: UNNotificationCategoryOptions(rawValue: 0))
        UNUserNotificationCenter.current().setNotificationCategories([categroy])
     
        // 3.设置通知代理，用于检测交互点击方法
        UNUserNotificationCenter.current().delegate = self;

    }
    
    
    @objc func send(button: UIButton) {
        
        button.setTitle("把程序退到后台, 3秒之后发送通知.", for: .normal)

        //4. 设置本地通知相关的属性 // 应该使用UNNotificationContent的子类来进行设定
        let content = UNMutableNotificationContent() //iOS 10
        
        // 设置应用程序的数字角标
        content.badge = 1;
        
        // 设置声音
        content.sound = UNNotificationSound.default
        
        // 设置内容
        content.title = "小怡";
        content.subtitle = "给你发了一条消息";
        content.body = "都过去那么久了,该忘记的事情就都忘记了吧.☺️";
        
        //5. 设置附件 可以是 音频 视频 图片 大小有限制
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "icon1.jpg", ofType: nil)!)
        let att = try! UNNotificationAttachment(identifier: "icon", url: path, options: nil)
        content.attachments = [att]
        
        //6. 设置触发时间及重复 用UNNotificationTrigger的子类实现
        /*
         UNPushNotificationTrigger
         UNTimeIntervalNotificationTrigger
         UNCalendarNotificationTrigger
         UNLocationNotificationTrigger
         */
        //TimeInterval: 发送通知的时间 repeats: 设置重复
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        //将categroy赋值到通知内容上
        content.categoryIdentifier = categoryid;
        
        
        //7.设置通知请求
        //Identifier: 通知的标示符, 用于区分不同的本地通知的
        //content: 相当于以前的设置本地通知属性的步骤  trigger: 设置触发时间及重复的类
        let request = UNNotificationRequest(identifier: "local", content: content, trigger: trigger)
        
        
        //8. 通过用户通知中心来添加一个本地通知的请求
        UNUserNotificationCenter.current().add(request) { (error) in
            if error == nil {
                
                lllog("线程 \(Thread.current)")
                
                lllog("通知完成 \(content)")
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                    self.b.setTitle("点击按钮发送通知🔔", for: .normal)
                })
                
            }
        }
    }
    
    
    //MARK: 通知代理
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        lllog("收到了点击事件 \(response)")
    }
    
}



