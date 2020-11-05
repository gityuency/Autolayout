//
//  OCCurveViewController.swift
//  AutoLayout
//
//  Created by aidong on 2020/11/5.
//  Copyright © 2020 姬友大人. All rights reserved.
//

import UIKit


//!!!!!!!!   请调整为横屏!!!!!!!


/*
 
 第一问:
 α = 0.036564459244395664
 β = 0.07374950015762405

 第二问:
 P0 = 0.0043
 p1 = 0.0277
 
 第三问:
 在样本具有代表性前提下, 结合 OC 曲线图, 可以看到,这两种抽样方案, 对与生产方来说, 弃真风险较小, 对于接收方来说,取伪风险也较小.
 在第一种情况下, α = 0.036564, β = 0.07375 双方风险相差较小, 对于买卖双方来说, 相对公平.
 第二种情况下,  α = 0.05, β = 0.1 这是一种推荐 α,β 取值对, 结合 OC曲线图, 同样可以认为对买卖双方来说,具有操作空间,具有公平性.
 
 
 备注: 老师您好, 我是一个程序猿, 做苹果手机APP开发的. 这次的作业我用的 Mac 电脑, 通过编程来完成本次作业. 只要按下一个按键, 就能一次性算出所有数据. 但是在编写程序的过程中, 也是需要花费大量时间去调试的.
       
 关于画图和求和计算: 使用电脑进行暴力计算, 合格品率我从 0.00% 取到了 100.00%, 一共是一万零一个数, 都把对应的接收概率P计算出来,
                 然后每个数值都在屏幕上描点, 因为点足够多, 就画出了 OC 曲线.
                 但是一万个点太多, 不适宜进行 作业中的 第二问, 第三问回答, 所以, 我取了曲线中变化最快的那一段进行放大,
                 于是就有了下方 从 0 - 0.05 描 501 个点的 OC 曲线, 这样图看起来就比较直观, 也易于求解.
 
 
 */
class OCCurveViewController: UIViewController {

    @IBOutlet weak var backShortK: UIView!
    
    ///宽1200 高 400
    @IBOutlet weak var backVVVV: UIView!
    /// 放曲线的背景
    lazy var backView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.orange
        v.frame = CGRect(x: 100, y: 100, width: 400, height: 400)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        
        for i in 0...10000 {
            let a = SecondQuestion.sumBinomialDistribution(m: 2, n: 190, p: i)
            let ki = (Double(i) * 0.01).roundTo(places: 2)
            print("不合格品率: \(ki)%    P: \(a)   α: \(1 - a)")
        }
        /*
         第一问:
         不合格品率: 0.38%    P: 0.9634355407556043   α: 0.036564459244395664
         α = 0.036564459244395664
         
         不合格品率: 3.0%    P: 0.07374950015762405   α: 0.926250499842376
         β = 0.07374950015762405
         
         */
                
        /*
         第二问:
         
         α 为 0.05, 那么 接受概率是 0.95
         在
         不合格品率: 0.43%    P: 0.9504782551776189   α: 0.04952174482238114
         P0 = 0.0043
          
         β 为 0.1
         不合格品率: 2.77%    P: 0.10092052472525978   α: 0.8990794752747402
         p1 = 0.0277
         
         */
        
    }
        
    ///这个函数是用来画曲线的
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        /// 放曲线的背景
        let bLayer = CALayer()
        //bLayer.backgroundColor = UIColor.blue.cgColor
        bLayer.frame = CGRect(x: 0, y: 0, width: backVVVV.frame.width, height: backVVVV.frame.height)
        backVVVV.layer.addSublayer(bLayer)
        
        var allPointArray = [Double]()
        
        for i in 0...10000 {
            let a = SecondQuestion.sumBinomialDistribution(m: 2, n: 190, p: i)
            let k = (1 - a) * 400.0
            allPointArray.append(k)
        }
        
        let pointWH: CGFloat = 1
        let rate: Double = 3 / 25.0
        
        // 添加分数点
        for (i, score) in allPointArray.enumerated() {
            let pLayer = CALayer()
            pLayer.frame = CGRect(x: 0, y: 0, width: pointWH, height: pointWH)
            //pLayer.cornerRadius = pointWH / 2
            pLayer.position = CGPoint(x: Double(i) * rate, y: (score))
            pLayer.backgroundColor = UIColor.red.cgColor
            bLayer.addSublayer(pLayer)
        }
        
        //开始二阶段的是算数
        startNew()
    }
    
    func startNew() {
        
        /// 放曲线的背景
        let bbbb = CALayer()
        //bLayer.backgroundColor = UIColor.blue.cgColor
        bbbb.frame = CGRect(x: 0, y: 0, width: backShortK.frame.width, height: backShortK.frame.height)
        backShortK.layer.addSublayer(bbbb)
        
        var allPointArray = [Double]()
        
        //不合格品率: 5.0%    P: 0.003555799076021292   α: 0.9964442009239787
        for i in 0...500 {
            let a = SecondQuestion.sumBinomialDistribution(m: 2, n: 190, p: i)
            let k = (1 - a) * 400.0
            allPointArray.append(k)
        }
        
        let pointWH: CGFloat = 1
        let rate: Double = 1200 / Double(allPointArray.count - 1)
        
        // 添加分数点
        for (i, score) in allPointArray.enumerated() {
            
            let pLayer = CALayer()
            
            if i == 43 || i == 277 {
            //if i == 38 || i == 300 {
                
                let heng = CALayer()
                heng.backgroundColor = UIColor.black.cgColor;
                heng.frame = CGRect(x: Double(i) * rate, y: score, width: 1, height: Double(bbbb.frame.height) - score)
                bbbb.addSublayer(heng)
                
                let shu = CALayer()
                shu.backgroundColor = UIColor.black.cgColor;
                shu.frame = CGRect(x: 0, y: score, width: Double(i) * rate, height: 1)
                bbbb.addSublayer(shu)
                
                let label = UILabel()
                let ki = (Double(i) * 0.01).roundTo(places: 2)
                let shuzhi = SecondQuestion.sumBinomialDistribution(m: 2, n: 190, p: i)
                label.text = "(\(ki)%, \(shuzhi.roundTo(places: 6)))"
                label.sizeToFit()
                
                label.frame = CGRect(x: CGFloat((Double(i) * rate) + 5), y: CGFloat(score - 10), width: label.frame.width, height: label.frame.height)
                backShortK.addSubview(label)
            }
            
            pLayer.backgroundColor = UIColor.red.cgColor
            pLayer.frame = CGRect(x: 0, y: 0, width: pointWH, height: pointWH)
            pLayer.position = CGPoint(x: Double(i) * rate, y: (score))
            bbbb.addSublayer(pLayer)
        }
    }
}

///保留两位小数 Rounds the double to decimal places value
extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
