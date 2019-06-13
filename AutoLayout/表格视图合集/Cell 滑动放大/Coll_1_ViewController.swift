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
        
        imagesArray = BundleImageManager.needAllBitchesImage
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 100, width: ScreenWidth, height: 400), collectionViewLayout: YXCellScaleFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.magenta.withAlphaComponent(0.2)
        collectionView?.register(UINib.init(nibName: ScaleCell.resuseid, bundle: nil), forCellWithReuseIdentifier: ScaleCell.resuseid)
        view.addSubview(collectionView)
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
}
