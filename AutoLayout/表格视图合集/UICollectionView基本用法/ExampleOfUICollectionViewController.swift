//
//  ExampleOfUICollectionViewController.swift
//  AutoLayout
//
//  Created by EF on 2019/6/28.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit

class ExampleOfUICollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //XIB加载
        collectionView?.register(UINib(nibName: ExampleHeaderView.reuseId, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ExampleHeaderView.reuseId)
        //代码加载
        collectionView?.register(ExampleFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ExampleFooterView.reuseId)
        //XIB加载
        collectionView?.register(UINib.init(nibName: ExampleCell.reuseId, bundle: nil), forCellWithReuseIdentifier: ExampleCell.reuseId)
        //代码加载
        collectionView.register(ExampleCodeCell.self, forCellWithReuseIdentifier: ExampleCodeCell.reuseId)
    }
}

extension ExampleOfUICollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Int(arc4random_uniform(10)) + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(arc4random_uniform(10)) + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExampleCodeCell.reuseId, for: indexPath) as! ExampleCodeCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExampleCell.reuseId, for: indexPath) as! ExampleCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind:  UICollectionView.elementKindSectionHeader, withReuseIdentifier: ExampleHeaderView.reuseId, for: indexPath) as! ExampleHeaderView
            return headerView
        } else if kind == UICollectionView.elementKindSectionFooter {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind:  UICollectionView.elementKindSectionFooter, withReuseIdentifier: ExampleFooterView.reuseId, for: indexPath) as! ExampleFooterView
            return footerView
        }
        return UICollectionReusableView()
    }
}


extension ExampleOfUICollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: 40, height: 40)
        } else {
            return CGSize(width: 70, height: 70)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 1, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 1, height: 20)
    }
}

extension ExampleOfUICollectionViewController: UICollectionViewDelegate {
    
}
