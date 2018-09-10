//
//  iOS10SpeechViewController.swift
//  AutoLayout
//
//  Created by 去年的那个夏天 on 2018/9/10.
//  Copyright © 2018年 yuency. All rights reserved.
//

import UIKit

//导入框架
import Speech

@available(iOS 10.0, *)

/// iOS 10 语音识别
/// 连续的语音识别
/// 可以从语音文件或者语言流中识别
/// 最佳化自由格式的听写和搜索式的字符串
/// 需要在 info.plist 文件中添加权限
class iOS10SpeechViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        SFSpeechRecognizer.requestAuthorization { (state) in
            print(state)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 初始化一个识别器
        let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "zh_CN"))
        
        // 初始化 mp3 的 url
        let url = Bundle.main.url(forResource: "voice.mp3", withExtension: nil)!
        
        // 初始化一个识别的请求
        let request = SFSpeechURLRecognitionRequest(url: url)
        
        recognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
            
            if error != nil {
                print("识别错误 %@",error as Any)
                return
            }
            print(result?.bestTranscription.formattedString as Any)
        })
    }
}
