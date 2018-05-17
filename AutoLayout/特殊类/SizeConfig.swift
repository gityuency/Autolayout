//
//  CommonSize.swift
//  EFParents
//
//  Created by yuency on 17/08/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import Foundation
import UIKit

let ScreenWidth = UIScreen.main.bounds.width

let ScreenHeight = UIScreen.main.bounds.height

let ScreenScale = UIScreen.main.scale

let sizeRate = (ScreenWidth / 375)

func SCVAL(_ value: CGFloat) -> CGFloat { return value * sizeRate }

let StatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height

let NavigationBarHeight: CGFloat = StatusBarHeight + 44

let Fix44: CGFloat = 44

let value10 = SCVAL(10)
let value20 = SCVAL(20)
let value40 = SCVAL(40)
let value44 = SCVAL(44)
let value60 = SCVAL(60)
let value80 = SCVAL(80)
let value100 = SCVAL(100)
let value150 = SCVAL(150)
let value200 = SCVAL(200)

