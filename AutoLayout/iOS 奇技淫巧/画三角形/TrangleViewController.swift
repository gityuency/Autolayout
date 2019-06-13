//
//  TrangleViewController.swift
//  AutoLayout
//
//  Created by EF on 2019/6/13.
//  Copyright © 2019 yuency. All rights reserved.
//

import UIKit

class TrangleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let v = TriangleView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 200))
        v.backgroundColor = UIColor.yellow
        v.showForeTriangle(topRate: 0.3, leftRate: 0.5, rightRate: 0.7)
        view.addSubview(v)
    }
}
