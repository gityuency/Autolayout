//
//  FPSLabel.swift
//  AutoLayout
//
//  Created by yuency on 20/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import Foundation
import UIKit

class FPSLabel: UILabel {
    
    fileprivate var _link :CADisplayLink?
    fileprivate var _count:Int = 0
    fileprivate var _lastTime:TimeInterval = 0
    fileprivate let _defaultSize = CGSize(width: 55, height: 20);
    
    override init(frame: CGRect) {
        var targetFrame = frame
        if frame.size.width == 0 && frame.size.height == 0 {
            targetFrame.size = _defaultSize
        }
        super.init(frame: targetFrame)
        self.layer.cornerRadius = 0
        self.clipsToBounds = true
        self.textAlignment = .center
        self.isUserInteractionEnabled = false
        self.textColor = UIColor.white
        //self.backgroundColor = UIColor(white: 0, alpha: 0.7)
        self.font = UIFont(name: "Menlo", size: 12)
        weak var weakSelf = self
        _link = CADisplayLink(target: weakSelf!, selector:#selector(FPSLabel.tick(_:)) );
        _link!.add(to: RunLoop.main, forMode:RunLoop.Mode.common)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func tick(_ link:CADisplayLink) {
        if _lastTime == 0  {
            _lastTime = link.timestamp
            return
        }
        _count += 1
        let delta = link.timestamp - _lastTime
        if delta < 1 {
            return
        }
        _lastTime = link.timestamp
        let fps = Double(_count) / delta
        _count = 0
        
        let progress = fps / 60.0;
        self.textColor = UIColor(hue: CGFloat(1 * ( progress - 0.2 )) , saturation: 1, brightness: 1, alpha: 1)
        self.text = "\(Int(fps+0.5))FPS"
    }
}
