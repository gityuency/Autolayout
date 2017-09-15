//
//  DemoVC0.swift
//  AutoLayout
//
//  Created by yuency on 15/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit


let kTimeInterval: TimeInterval = 0.8


class DemoVC0: ViewsViewController {
    
    
    let timer = Timer(timeInterval: kTimeInterval, target: self, selector: #selector(runAnimation), userInfo: nil, repeats: true)
    
    
    let widthRatio: CGFloat = 0.4
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        
        
    }
    
    
    @objc  private func runAnimation() {
        
    }
    
    
}
