//
//  BrickPosition.swift
//  Jubeatgame
//
//  Created by killerhi2001 on 2016/6/5.
//  Copyright © 2016年 心怡陳. All rights reserved.
//

import UIKit
import SpriteKit
class BrickPosition: NSObject {
    var BrickPositionArray = [CGPoint]()
    
    override init() {
        for i in 0 ... 15{
            var position = CGPoint(x: 355 + ((i%4)*105) , y:53 + ((i/4)*101))
            BrickPositionArray.append(position)
        }
    }
    
    
}
