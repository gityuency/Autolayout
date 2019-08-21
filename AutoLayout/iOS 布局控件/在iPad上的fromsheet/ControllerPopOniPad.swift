//
//  ControllerUseSystemNaviBar.swift
//  POP
//
//  Created by EF on 2019/8/15.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit

class ControllerPopOniPad: UIViewController {

    deinit {
        print("ControllerPopOniPad 销毁了")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "导航栏: 不再写代码"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
