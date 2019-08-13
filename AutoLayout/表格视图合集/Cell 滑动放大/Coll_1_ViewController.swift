//
//  Coll_1_ViewController.swift
//  AutoLayout
//
//  Created by EF on 2019/6/13.
//  Copyright © 2019 yuency. All rights reserved.
//

import UIKit

class Coll_1_ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    var imagesArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagesArray = BundleImageManager.needAllImage + BundleImageManager.needAllHeadImage + BundleImageManager.needAllBitchesImage
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 100, width: ScreenWidth, height: 400), collectionViewLayout: YXCellScaleFlowLayout())
        
        
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        //UICollectionView 滑动过快 设置减速
        //collectionView.decelerationRate = UIScrollView.DecelerationRate(rawValue: 0.5)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.magenta.withAlphaComponent(0.2)
        collectionView?.register(UINib.init(nibName: ScaleCell.resuseid, bundle: nil), forCellWithReuseIdentifier: ScaleCell.resuseid)
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //如果是为了做各种屏幕的适配, 比如,要在 iPhone 和 iPad 上 都做正常的显示,就需要写一些看似垃圾但确实垃圾的代码
        //可以在改变布局的时候使用不同的layout?
        //要么就像这样, 重新设定 collectionView的布局, 然后刷新, 就会走 sizeForItemAt indexPath 这个代理方法,重新设定cell的大小
        //一点都不好玩
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            collectionView.frame = CGRect(x: 0, y: 0, width: view.width, height: 500)
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            let ori = UIDevice.current.orientation
            if (ori == .portrait) || (ori == .portraitUpsideDown) {
                collectionView.frame = CGRect(x: 0, y: 0, width: view.width, height: 400)
            } else if (ori == .landscapeLeft) || (ori == .landscapeRight) {
                collectionView.frame = CGRect(x: 0, y: 0, width: view.width, height: 300)
            }
        }
        collectionView.center = view.center
        collectionView.reloadData()
    }
    
}


// MARK: - UICollectionView
extension Coll_1_ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScaleCell.resuseid, for: indexPath) as! ScaleCell
        cell.imageView.image = imagesArray[indexPath.row]
        return cell
    }
    
    /// 写这个是为了屏幕适配,还有好的方法吗.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            return CGSize(width: 400, height: 400)
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            let ori = UIDevice.current.orientation
            if (ori == .portrait) || (ori == .portraitUpsideDown) {
                return CGSize(width: 260, height: 360)
            } else if (ori == .landscapeLeft) || (ori == .landscapeRight) {
                return CGSize(width: 300, height: 250)
            }
        }
        return CGSize(width: 260, height: 360)
    }
    
}
