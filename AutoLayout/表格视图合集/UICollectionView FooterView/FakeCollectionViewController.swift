//
//  FakeCollectionViewController.swift
//  AutoLayout
//
//  Created by EF on 2019/8/20.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit

class FakeCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    /// 复用 ID
    let rid = "rid"
    
    /// 单元格个数
    var cellcount = 10
    
    /// FooterView的高度
    let FooterHeight: CGFloat = 60
    
    /// 记录 collectionview 的内容高度
    var contentHeight: CGFloat = 0
    
    /// 放在底部的View
    lazy var footerView: UIButton = {
        let b = UIButton()
        b.setTitle("点击 FooterView", for: UIControl.State.normal)
        b.backgroundColor = UIColor.brown
        b.addTarget(self, action: #selector(click), for: .touchUpInside)
        return b
    }()
    
    @objc func click() {
        print("测试是否可以点击")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: rid)
        collectionView.addSubview(footerView)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: FooterHeight, right: 0)
        // contentSize 是不包括 EdgeInsets的
    }
}


extension FakeCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellcount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rid, for: indexPath)
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        cellcount += 10
        collectionView.reloadData()
    }
    
    // 在这个方法里面可以拿到视图的内容高度
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if contentHeight == collectionView.contentSize.height { //如果内容高度没有变化,就不需要设置footer的位置
            return
        }
        
        contentHeight = collectionView.contentSize.height
        
        if collectionView.frame.height > collectionView.contentSize.height + FooterHeight { //当视图的高度 比 (内容高度 + Footer高度) 大的时候
            
            DispatchQueue.main.async {
                print("直接放到collectionview的底部: \(collectionView.contentSize.height)")
                let w = collectionView.bounds.width
                let y = collectionView.frame.height - self.FooterHeight
                self.footerView.frame = CGRect(x: 0, y: y, width: w, height: self.FooterHeight)
            }
            
        } else {
            
            DispatchQueue.main.async {
                print("根据内容高度调整到底部: \(collectionView.contentSize.height)")
                let w = collectionView.bounds.width
                let y = collectionView.contentSize.height
                self.footerView.frame = CGRect(x: 0, y: y, width: w, height: self.FooterHeight)
            }
        }
    }
}

//if (cellcount - 1) == collectionView.indexPathsForVisibleItems.last?.row { // 这里表示要显示最后一个cell
//}
