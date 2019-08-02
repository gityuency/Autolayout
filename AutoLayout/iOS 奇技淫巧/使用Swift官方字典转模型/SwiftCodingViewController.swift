//
//  SwiftCodingViewController.swift
//  AutoLayout
//
//  Created by EF on 2019/7/29.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit
import Alamofire

class SwiftCodingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// 字典转模型
    @IBAction func actionDicToModel(_ sender: UIButton) {
        
        let urlString = "http://www.yuency.com/yuencyDictionary.json"
        
        Alamofire.request(urlString).responseJSON { (json) in
            
            switch json.result {
                
            case .success:
                
                // 字典转模型
                let modelObject = YXTransferToModel.toModelObject(json.result.value, to: HomePageModel.self)
                
                //模型转 json / 字典
                print("--->\n \(YXTransferToJson.model(toString: modelObject) ?? "失败")")
                print("--->\n \(YXTransferToJson.model(toDictionary: modelObject) ?? ["失败":"失败"])")
                
                if let modelObject = modelObject {
                    
                    // 把模型 存到 userdefault 里
                    YXSaverForUserDefaults.saveToUserDefaults(key: YXSaverForUserDefaults.KeyHomePageModel, with: modelObject)
                    
                    // 把模型存到沙盒里
                    YXSaverForSandBox.saveToSandBox(key: YXSaverForSandBox.KeyCacheModelName, with: modelObject)
                    
                    // 按照日期把数据存到沙盒(会存很多这样的文件)
                    YXSaverForSandBox.save(model: modelObject)
                }
                
            case .failure(let error):
                print("网络请求失败 \(error)")
            }
        }
    }
    
    /// 数组转模型
    @IBAction func actionArrToModel(_ sender: UIButton) {
        
        let urlString = "http://www.yuency.com/yuencyArray.json"
        
        Alamofire.request(urlString).responseJSON { (json) in
            
            switch json.result {
                
            case .success:
                
                // 数组转模型
                let modelArray = YXTransferToModel.toModelArray(json.result.value, to: FruitsInfo.self)
                
                //模型数组转 json / Array
                print("--->\n \(YXTransferToJson.model(toString: modelArray) ?? "失败")")
                print("--->\n \(YXTransferToJson.model(toArray: modelArray) ?? ["失败"])")
                
                if let modelArray = modelArray {
                    
                    // 把模型数组 存到 userdefault 里
                    YXSaverForUserDefaults.saveToUserDefaults(key: YXSaverForUserDefaults.KeyFruitsArray, with: modelArray)
                    
                    // 把模型数组 存到沙盒里
                    YXSaverForSandBox.saveToSandBox(key: YXSaverForSandBox.KeyCacheArrayName, with: modelArray)
                }
                
            case .failure(let error):
                print("网络请求失败 \(error)")
            }
        }
    }
    
    @IBAction func actionFetchDataFromUserDefault(_ sender: UIButton) {
        // 从UserDefaults取出模型
        let modelObject = YXSaverForUserDefaults.fetchFromUserDefaults(key: YXSaverForUserDefaults.KeyHomePageModel, asObject: HomePageModel.self)
        print(modelObject ?? "没有解出来")
        
        // 从UserDefaults取出模型
        let modelArray = YXSaverForUserDefaults.fetchFromUserDefaults(key: YXSaverForUserDefaults.KeyFruitsArray, asArray: FruitsInfo.self)
        print(modelArray ?? "没有解出来")
    }
    
    
    @IBAction func actionFetchDataFromSandBox(_ sender: UIButton) {
        //从沙盒里取出模型
        let modelObjectFromSanBox = YXSaverForSandBox.fetchFromSandBox(key: YXSaverForSandBox.KeyCacheModelName, asObject: HomePageModel.self)
        print(modelObjectFromSanBox ?? "没有解出来")
        
        //从沙盒里取出模型数组
        let modelArrayFromSanBox = YXSaverForSandBox.fetchFromSandBox(key: YXSaverForSandBox.KeyCacheArrayName, asArray: FruitsInfo.self)
        print(modelArrayFromSanBox ?? "没有解出来")
    }
    
    
    @IBAction func actionClearAll(_ sender: UIButton) {
        
        YXSaverForUserDefaults.clearCacheModel(key: YXSaverForUserDefaults.KeyHomePageModel)
        YXSaverForUserDefaults.clearCacheModel(key: YXSaverForUserDefaults.KeyFruitsArray)
        
        YXSaverForSandBox.removeAll()
    }
}
