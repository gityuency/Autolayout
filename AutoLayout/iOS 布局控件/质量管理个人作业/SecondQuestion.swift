//
//  SecondQuestion.swift
//  OC_HomeWork
//
//

import Foundation

/// 这个就是我用来做二项式计算的代码
class SecondQuestion {
    
    /// 二项分布求和
    /// - Parameters:
    ///   - m: 组合的上
    ///   - n: 组合的下
    ///   - p: 概率
    /// - Returns: 求和结果
    static func sumBinomialDistribution(m: Int, n:Int, p:Int) -> Double {
        var result: Double = 0
        for i in 0..<m {
            result = result + calculateBinomialDistribution(m: i, n: n, p: p)
        }
        result = result + calculateBinomialDistribution(m: m, n: n, p: p)
        //print("单次求和结果: \(result)")
        return result
    }
    
    
    /// 计算单个二项分布
    /// - Parameters:
    ///   - m: 上方
    ///   - n: 下方
    ///   - p: 发生的概率, 这个概率如果使用小数, 那么就会有精度丢失的问题, 那么, 在传入的时候,把这个精度使用 Int, 在计算的时候, 再转换成Double 取值范围 0-100
    ///   - d: 发生了多少次
    /// - Returns: 本次二项分布的概率
    static func calculateBinomialDistribution(m: Int, n:Int, p: Int) -> Double {
        let a = Double(xindejiechengfanan(m: m, n: n))
        let b = pow(Double(p) * 0.0001, Double(m))
        let c = pow((Double(10000 - p)) * 0.0001, Double(n - m))
        let result = a * b * c;
        return result
    }
    
    //计算组合数
    static func xindejiechengfanan(m: Int, n: Int) -> Int {
        
        var fenMuArray = [Int]()
        var fenZiArray = [Int]()
        
        //去掉最大的数
        let l = m
        let r = n - m
        var count: Int = 0
        if l > r {
            count = (n - l)
        } else {
            count = (n - r)
        }
        var k = n
        for _ in 0..<count {
            fenZiArray.append(k)
            k = k - 1
        }
        //print("fenZiArray  \(fenZiArray)")
        
        var B: Int = 0
        let zuixiaofenmuxunhuanshu = l > r ? r : l
        for _ in 0..<zuixiaofenmuxunhuanshu {
            B = B + 1
            fenMuArray.append(B)
        }
        if fenMuArray.count > 0 {
            fenMuArray.remove(at: fenMuArray.firstIndex(of: 1)!)
        }
        //print("fenMuArray  \(fenMuArray)")
        
        //把分子里面的每一个数,分解质因数,然后放到数组里面
        var fenziFenjiezhiyinshu = [Int]()
        for i in fenZiArray {
            fenziFenjiezhiyinshu += needZhiYinShuZu(n: i)
        }
        //print("fenziFenjiezhiyinshu \(fenziFenjiezhiyinshu)")
        
        var fenmufenjieshuzu = [Int]()
        for i in fenMuArray {
            fenmufenjieshuzu += needZhiYinShuZu(n: i)
        }
        //print("fenmufenjieshuzu \(fenmufenjieshuzu)")
        
        //遍历分子数组,然后把分母中相同元素移除掉
        for i in fenmufenjieshuzu {
            for k in fenziFenjiezhiyinshu.reversed() {
                if k == i {
                    fenziFenjiezhiyinshu.remove(at: fenziFenjiezhiyinshu.firstIndex(of: k)!)
                    break
                }
            }
        }
        
        //print("简化之后 fenziFenjiezhiyinshu \(fenziFenjiezhiyinshu)")
        let sum = fenziFenjiezhiyinshu.reduce(1,{$0 * $1})
        //print(sum)
        return sum;
    }
    
    
    /// 得到一个数分解质因数后的数组
    /// - Parameter n: 需要分解的数
    /// - Returns: 数组
    static func needZhiYinShuZu(n: Int) -> [Int] {
        var result = [Int]()
        @discardableResult
        func fenjizhiyinshu(n: Int) -> Int {
            
            for i in 2..<n {
                if (n % i == 0) {
                    let temp = n / i
                    result.append(i)
                    return fenjizhiyinshu(n: temp)
                }
            }
            result.append(n)
            return n;
        }
        fenjizhiyinshu(n: n)
        //print("分解得到质因数数组: \(result)")
        return result
    }
}

