//
//  SwiftCoding_2_ViewController.swift
//  AutoLayout
//
//  Created by EF on 2019/8/13.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit
import Alamofire

class SwiftCoding_2_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionGo(_ sender: UIButton) {
        
        let urlString = "http://www.yuency.com/yuencyDictionary.json"
        
        Alamofire.request(urlString).responseJSON { (json) in
            
            switch json.result {
                
            case .success:
                
                let farmer = YXTransferToModel.toModelObject(json.result.value, to: FarmerModel.self)
                if let farmer = farmer {
                    FarmerSaver.save(data: farmer, key: FarmerSaver.key)
                }
                
            case .failure(let error):
                print("网络请求失败 \(error)")
            }
        }
        
    }
    
    @IBAction func actionFetch(_ sender: UIButton) {
    
        if let data = FarmerSaver.loadDataWithCodable(key: FarmerSaver.key), let farmer = FarmerModel.convert(from: data) {
            print(farmer)
        } else {
            print("没有金坷垃")
        }
    }
    
    
    @IBAction func actionClear(_ sender: UIButton) {
        FarmerSaver.removeAll()
    }
}




