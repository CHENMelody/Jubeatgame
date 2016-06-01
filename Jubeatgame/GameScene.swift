//
//  GameScene.swift
//  Jubeatgame
//
//  Created by 心怡陳 on 2016/5/28.
//  Copyright (c) 2016年 心怡陳. All rights reserved.
//

import SpriteKit
class GameScene: SKScene {


struct PhysicsCatagory{
    static let Brick: UInt32 = 0x1 << 0 
    static let Check: UInt32 = 0x1 << 1
    

}

class GameScene: SKScene,SKPhysicsContactDelegate {
    var touch = SKSpriteNode()
    var token = SKSpriteNode()
    var background = SKSpriteNode()
    var texturearray = [SKTexture]()
    var toucharray = [SKSpriteNode]()


    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    }
}