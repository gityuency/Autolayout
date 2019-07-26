//
//  PageControlViewController.swift
//  AutoLayout
//
//  Created by EF on 2019/6/13.
//  Copyright © 2019 yuency. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: YXPageControl!
    
    @IBOutlet weak var pp1: YXPageControl!
    @IBOutlet weak var pp2: YXPageControl!
    @IBOutlet weak var pp3: YXPageControl!
    @IBOutlet weak var pp4: YXPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width + 0.5)
        pageControl.currentPage = page
        pp1.currentPage = page
        pp2.currentPage = page
        pp3.currentPage = page
        pp4.currentPage = page
    }
    
    
}
