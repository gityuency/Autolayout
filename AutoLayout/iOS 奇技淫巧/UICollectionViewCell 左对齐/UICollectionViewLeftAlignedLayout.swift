//
//  UICollectionViewLeftAlignedLayout.swift
//  AutoLayout
//
//  Created by yuency on 2018/11/9.
//  Copyright © 2018年 yuency. All rights reserved.
//

import UIKit

extension UICollectionViewLayoutAttributes {
    func leftAlignFrameWithSectionInset(_ sectionInset:UIEdgeInsets){
        var frame = self.frame
        frame.origin.x = sectionInset.left
        self.frame = frame
    }
}

class UICollectionViewLeftAlignedLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        //调用父类方法获取布局信息
        var attributesCopy: [UICollectionViewLayoutAttributes] = []
        
        //把布局信心拷贝一份新的
        if let attributes = super.layoutAttributesForElements(in: rect) {
            attributes.forEach({ attributesCopy.append($0.copy() as! UICollectionViewLayoutAttributes) })
        }
        
        for attributes in attributesCopy {
            if attributes.representedElementKind == nil { //说明是 cell, 过滤掉头尾视图
                let indexpath = attributes.indexPath
                if let attr = layoutAttributesForItem(at: indexpath) {  //调用自己重写的父类方法,更新布局
                    attributes.frame = attr.frame
                }
            }
        }
        return attributesCopy
    }
    
    ///重写父类方法, 获得每一个 cell 的布局
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        //这个方法在 For 循环里调用的, 在这里又调用了父类方法拿到 cell 布局, 也就是说,对于每一个 cell, 都是先拿到系统的布局, 系统会自动把能够插入当前行的 cell 插进去
        if let currentItemAttributes = super.layoutAttributesForItem(at: indexPath as IndexPath)?.copy() as? UICollectionViewLayoutAttributes {
            
            let sectionInset = self.evaluatedSectionInsetForItem(at: indexPath.section)
            
            let isFirstItemInSection = indexPath.item == 0
            
            let layoutWidth = self.collectionView!.frame.width - sectionInset.left - sectionInset.right
            
            if (isFirstItemInSection) {  //如果是section 里面的第一个 cell
                currentItemAttributes.leftAlignFrameWithSectionInset(sectionInset)  //直接进行布局, 放到当前 section 的左边
                return currentItemAttributes
            }
            
            //代码走到这里说明 cell 不止一个
            let previousIndexPath = IndexPath.init(row: indexPath.item - 1, section: indexPath.section)
            
            //寻找前一个 cell 的 frame
            let previousFrame = layoutAttributesForItem(at: previousIndexPath)?.frame ?? CGRect.zero
            
            //上一个 cell 最右边的点
            let previousFrameRightPoint = previousFrame.maxX
            //当前 cell frame
            let currentFrame = currentItemAttributes.frame
            
            let strecthedCurrentFrame = CGRect.init(x: sectionInset.left, y: currentFrame.origin.y, width: layoutWidth, height: currentFrame.size.height)
            // if the current frame, once left aligned to the left and stretched to the full collection view
            // widht intersects the previous frame then they are on the same line
            let isFirstItemInRow = !previousFrame.intersects(strecthedCurrentFrame)  //判断前一个 frame 和当前拉伸的 frame 是不是重叠了
            
            if (isFirstItemInRow) { //如果他们没有重叠,那就是下一行的第一个元素
                // make sure the first item on a line is left aligned
                currentItemAttributes.leftAlignFrameWithSectionInset(sectionInset) //这个元素成为了当前行的第一个元素,就左对齐.
                return currentItemAttributes
            }
            
            //到这里就是重叠了,向后布局同一行的cell
            var frame = currentItemAttributes.frame
            frame.origin.x = previousFrameRightPoint + evaluatedMinimumInteritemSpacing(at: indexPath.section)
            currentItemAttributes.frame = frame
            return currentItemAttributes
            
        }
        return nil
    }
    
    func evaluatedMinimumInteritemSpacing(at sectionIndex:Int) -> CGFloat {
        if let delegate = self.collectionView?.delegate as? UICollectionViewDelegateFlowLayout {
            let inteitemSpacing = delegate.collectionView?(self.collectionView!, layout: self, minimumInteritemSpacingForSectionAt: sectionIndex)
            if let inteitemSpacing = inteitemSpacing {
                return inteitemSpacing
            }
        } else {
            print("请遵守代理: UICollectionViewDelegateFlowLayout, 实现方法: minimumInteritemSpacingForSectionAt 或者设置 minimumInteritemSpacing ")
        }
        return self.minimumInteritemSpacing
        
    }
    
    func evaluatedSectionInsetForItem(at index: Int) ->UIEdgeInsets {
        if let delegate = self.collectionView?.delegate as? UICollectionViewDelegateFlowLayout {
            let insetForSection = delegate.collectionView?(self.collectionView!, layout: self, insetForSectionAt: index)
            if let insetForSectionAt = insetForSection {
                return insetForSectionAt
            }
        } else {
            print("请遵守代理: UICollectionViewDelegateFlowLayout, 实现方法: insetForSectionAt 或者设置 sectionInset")
        }
        return self.sectionInset
    }
}
