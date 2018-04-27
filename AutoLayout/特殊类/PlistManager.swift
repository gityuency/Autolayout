//
//  PlistManager.swift
//  AutoLayout
//
//  Created by yuency on 27/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import Foundation

class PlistManager {
    
    static func needAllChineseName() -> [String] {
        guard let path = Bundle.main.path(forResource: "NameList_Unfamiliar", ofType: "plist"),
            let array = NSArray(contentsOfFile: path),
            let namelist = array as? [String] else {
                return ["姬友大人"]
        }
        return namelist
    }
    
}

