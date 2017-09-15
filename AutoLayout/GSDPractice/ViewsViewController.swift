//
//  ViewsViewController.swift
//  AutoLayout
//
//  Created by yuency on 15/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class ViewsViewController: UIViewController {

    ///
    var view0 = UIView(backColor: UIColor.red)
    
    ///
    var view1 = UIView(backColor: UIColor.gray)
    
    ///
    var view2 = UIView(backColor: UIColor.brown)
    
    ///
    var view3 = UIView(backColor: UIColor.orange)
    
    ///
    var view4 = UIView(backColor: UIColor.purple)
    
    ///
    var view5 = UIView(backColor: UIColor.yellow)
    
    ///
    var view6 = UIView(backColor: UIColor.cyan)
    
    ///
    var view7 = UIView(backColor: UIColor.magenta)
    
    ///
    var view8 = UIView(backColor: UIColor.black)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        view.sd_addSubviews([view0, view1, view2, view3, view4, view5, view6, view7, view8])
        
    }
    
}
