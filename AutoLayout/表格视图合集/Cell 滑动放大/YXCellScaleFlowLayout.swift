//
//  YXCellScaleFlowLayout.swift
//  AutoLayout
//
//  Created by EF on 2019/6/13.
//  Copyright © 2019 yuency. All rights reserved.
//

import UIKit


class YXCellScaleFlowLayout: UICollectionViewFlowLayout {
    
    ///单元格的宽度
    private let K_CELL_WIDTH: CGFloat = 260
    
    override init() {
        super.init()
        
        itemSize = CGSize(width: K_CELL_WIDTH, height: 360) //cell的大小自定义
        scrollDirection = .horizontal
        minimumLineSpacing = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    /// 不想频繁去取值, 直接提出来一个属性, 然后直接计算出半宽
    var collectionViewFrameWidth: CGFloat = 0 {
        didSet {
            collectionViewFrameWidthHalf = collectionViewFrameWidth / 2
        }
    }
    
    var collectionViewFrameWidthHalf: CGFloat = 0
    
    var collectionViewFrameHeight: CGFloat = 0
    
    /// 不想每次都去创建这个属性,所以提出来
    var visibleRect = CGRect.zero
    
    /// 把相关属性初始化放到一起,初始化一次就可以了,在
    func needViewInfo() {
        
        if collectionViewFrameWidth != collectionView?.frame.width {
            collectionViewFrameWidth = collectionView?.frame.width ?? 0
            let offsetXY = (collectionViewFrameWidth - K_CELL_WIDTH) / 2
            //在滑动到左右两端的时候, 需要让头尾的cell居中显示,那就需要设置边缘距离, 这个距离就是 屏幕宽-cell宽 除以 2
            sectionInset = UIEdgeInsets(top: 0, left: offsetXY, bottom: 0, right: offsetXY)
        }
        
        if collectionViewFrameHeight != collectionView?.frame.height {
            collectionViewFrameHeight = collectionView?.frame.height ?? 0
        }
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        //先做一下相关属性的初始化
        needViewInfo()
        
        //可视区域
        visibleRect.origin = collectionView?.contentOffset ?? CGPoint.zero
        visibleRect.size = collectionView?.frame.size ?? CGSize.zero
        
        //屏幕中线
        let centerX = visibleRect.midX
        
        ///获取到可以看见的cell的数组,看不见的cell就不要了 如果这里传入 rect, 那获取到的就是所有缓存中的cell, 并不是全部的总cell个数
        let array = super.layoutAttributesForElements(in: visibleRect) ?? []
        
        for attributes in array {
            
            // 随着滑动, centerX 是一直都在改变的, 但是每个cell的 attributes.center.x 是不变的
            let distance = abs(centerX - attributes.center.x)  //for循环中当前cell和可见区域的中心点的距离
            
            let scaleRate = distance / (collectionView?.bounds.width ?? 0)
            
            // 使用 cos 函数,把缩放的比值转换成一个 1 以为的数值
            // 在 scaleRate 后面乘上一个数,就可以控制卡片缩放的剧烈程度
            let scale = abs(cos(scaleRate * 1.1))
            
            //scaleRate == 0, 越是接近 centerX 的那个 attribute, 他的缩放就越接近于1(就是cell原来的大小), 可以直接使用这样的缩放,这样的缩放,卡片的大小变化不剧烈
            //let scale = abs(cos(scaleRate))
            
            attributes.transform3D = CATransform3DMakeScale(scale, scale, 1)
            
        }
        return array
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        //被推出屏幕的长度 + 屏幕宽度的一半
        let horizontalCenter = proposedContentOffset.x + collectionViewFrameWidthHalf
        
        //获取一个当前CollectionView的尺寸大小,然后这个尺寸的 X 就是滑动停止时候的偏移
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0.0, width: collectionViewFrameWidth, height: collectionViewFrameHeight)
        
        //用这个方法取得当前能看到的所有的cell
        let array = super.layoutAttributesForElements(in: targetRect) ?? []
        
        //记录每次遍历取到的最小的距离中心的距离
        var nearestCenterOne = CGFloat(MAXFLOAT)
        
        //记录距离中心最近的那个layoutitem的中心点x
        var shouldBeX: CGFloat = 0
        
        //遍历当前数组里面的元素,找到里中心点最近的那个元素,把这个元素的中心位置拿到,然后返回给函数
        for layoutAttributes in array {
            let currentX = layoutAttributes.center.x
            let currentDistance = abs(currentX - horizontalCenter)
            if currentDistance < nearestCenterOne {
                nearestCenterOne = currentDistance
                shouldBeX = currentX
            }
        }
        
        let X = shouldBeX - collectionViewFrameWidthHalf
        return CGPoint(x: X , y: proposedContentOffset.y)
    }
}
