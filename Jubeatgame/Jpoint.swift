//
//  Jpoint.swift
//  Jubeatgame
//
//  Created by killerhi2001 on 2016/6/5.
//  Copyright © 2016年 心怡陳. All rights reserved.
//

import UIKit
import SpriteKit
class Jpoint: SKSpriteNode {
    
    
    init(){
//        let texture = SKTexture(imageNamed: "token")
        let test = SKTexture(imageNamed:"brickbackground")
        super.init(texture: test, color: UIColor.clearColor(), size:CGSizeMake(50, 50))
        self.physicsBody = SKPhysicsBody(circleOfRadius:40)
//        self.position = CGPointMake(500 , 230 )
        self.physicsBody?.categoryBitMask = PhysicsCatagory.Check
        self.physicsBody?.contactTestBitMask = PhysicsCatagory.Brick
        self.physicsBody?.collisionBitMask = 0

        self.name = "Jpoint"
        self.physicsBody?.dynamic = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
