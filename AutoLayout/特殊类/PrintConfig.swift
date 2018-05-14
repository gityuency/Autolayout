//
//  Print.swift
//  EFParents
//
//  Created by yuency on 17/08/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import Foundation
import QuartzCore

/// 打印这行代码的 文件/类/方法/行 信息
func printLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
        print("\n📍 \((file as NSString).lastPathComponent), line:\(line), \(method), \(message) \n")
    #endif
}

/// 打印代码执行所在的线程
func printInThread() {
    #if DEBUG
        print( "\n〽️ MainThread: \(Thread.main), \n ** CurrentThread: \(Thread.current), \n ** InMain: \(Thread.isMainThread) \n")
    #endif
}

/// 为了省事所用的打印方法
func lllog(_ item: @autoclosure () -> Any) {
    #if DEBUG
        print(item())
    #endif
}

/// 测量代码执行时间
func measure(f: ()->()) {
    let start = CACurrentMediaTime()
    f()
    let end = CACurrentMediaTime()
    print("\n⚡️ Measure Time：\(end - start)")
}
