//
//  TriangleView.swift
//  AutoLayout
//
//  Created by EF on 2019/6/13.
//  Copyright © 2019 yuency. All rights reserved.
//

import UIKit

class TriangleView: UIView {
    
    ///最小长度
    private var minLength: CGFloat {
        return self.frame.size.width > self.frame.size.height ? self.frame.size.height : self.frame.size.width
    }
    
    ///半径
    private var R: CGFloat {
        return Y
    }
    
    ///视图中心点 X
    private var X: CGFloat {
        return self.frame.size.width * 0.5
    }
    
    ///三角形的中心点 Y
    private var Y: CGFloat {
        return minLength * 2 / 3
    }
    
    /// sin
    private let sinValue = sin(CGFloat.pi / 6)
    
    /// cos
    private let cosValue = cos(CGFloat.pi / 6)
    
    ///最外圈三角形
    private var outterTriangleLayer: CAShapeLayer = {
        let l = CAShapeLayer()
        l.strokeColor = UIColor.red.withAlphaComponent(0.5).cgColor
        l.fillColor = UIColor.clear.cgColor
        l.opacity = 1
        l.lineWidth = 2
        return l
    }()
    
    ///内圈三角形
    private var innerTriangleLayer: CAShapeLayer = {
        let l = CAShapeLayer()
        l.strokeColor = UIColor.red.withAlphaComponent(0.5).cgColor
        l.fillColor = UIColor.clear.cgColor
        l.opacity = 1
        l.lineWidth = 1
        return l
    }()
    
    ///前景绿色填充的三角形
    private var foregroundTriangleLayer: CAShapeLayer = {
        let l = CAShapeLayer()
        l.fillColor = UIColor.green.withAlphaComponent(0.5).cgColor
        return l
    }()
    
    ///中心点到三个顶点的连线
    private var lineLayer: CAShapeLayer = {
        let l = CAShapeLayer()
        l.strokeColor = UIColor.red.withAlphaComponent(0.5).cgColor
        l.fillColor = UIColor.clear.cgColor
        l.opacity = 1
        l.lineWidth = 0.5
        return l
    }()
    
    private var topRate: CGFloat = 0
    private var leftRate: CGFloat = 0
    private var rightRate: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView() {
        self.layer.addSublayer(outterTriangleLayer)
        self.layer.addSublayer(innerTriangleLayer)
        self.layer.addSublayer(lineLayer)
        self.layer.addSublayer(foregroundTriangleLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        outterTriangleLayer.path = drawTriangle(cornerRadius: R, centerToTop: 1, centerToLeft: 1, centerToRight: 1)
        innerTriangleLayer.path = drawTriangle(cornerRadius: R, centerToTop: 0.5, centerToLeft: 0.5, centerToRight: 0.5)
        lineLayer.path = drawLine(cornerRadius: R)
        
        drawForeTriangle()
    }
    
    private func drawForeTriangle() {
        if (topRate + leftRate + rightRate) != 0 {
            foregroundTriangleLayer.path = drawTriangle(cornerRadius: R, centerToTop: topRate, centerToLeft: leftRate, centerToRight: rightRate)
        }
    }
    
    func showForeTriangle(topRate: CGFloat, leftRate: CGFloat, rightRate: CGFloat) {
        self.topRate = topRate
        self.leftRate = leftRate
        self.rightRate = rightRate
        drawForeTriangle()
    }
    
    private var centerPoint: CGPoint {
        return CGPoint(x: X, y: Y)
    }
    
    
    /// 画三角形
    ///
    /// - Parameters:
    ///   - cornerRadius: 半径(中心点到顶点的距离,剩下三个参数如果相同,画正三角形)
    ///   - centerToTop: 从中心点到顶点的百分比 取值:0.0 - 1.0
    ///   - centerToLeft: 从中心点到顶点的百分比 取值:0.0 - 1.0
    ///   - centerToRight: 从中心点到顶点的百分比 取值:0.0 - 1.0
    /// - Returns: path
    private func drawTriangle(cornerRadius: CGFloat, centerToTop: CGFloat, centerToLeft: CGFloat, centerToRight: CGFloat) -> CGPath {
        let path = UIBezierPath()
        let pointTop = CGPoint(x: centerPoint.x, y: centerPoint.y - cornerRadius * centerToTop)
        path.move(to: pointTop)
        let pointLeft = CGPoint(x: centerPoint.x - cornerRadius * centerToLeft * cosValue, y: centerPoint.y + cornerRadius * centerToLeft * sinValue)
        path.addLine(to: pointLeft)
        let pointRight = CGPoint(x: centerPoint.x + cornerRadius * centerToRight * cosValue, y: centerPoint.y + cornerRadius * centerToRight * sinValue)
        path.addLine(to: pointRight)
        path.close()
        return path.cgPath
    }
    
    
    /// 画从中心点到三个顶点的连线
    ///
    /// - Parameter cornerRadius: 半径
    /// - Returns:
    private func drawLine(cornerRadius: CGFloat) -> CGPath {
        let path = UIBezierPath()
        let pointTop = CGPoint(x: centerPoint.x, y: centerPoint.y - cornerRadius)
        let pointLeft = CGPoint(x: centerPoint.x - cornerRadius * cosValue, y: centerPoint.y + cornerRadius * sinValue)
        let pointRight = CGPoint(x: centerPoint.x + cornerRadius * cosValue, y: centerPoint.y + cornerRadius * sinValue)
        path.move(to: pointTop)
        path.addLine(to: centerPoint)
        path.addLine(to: pointLeft)
        path.move(to: centerPoint)
        path.addLine(to: pointRight)
        path.close()
        return path.cgPath
    }
}
