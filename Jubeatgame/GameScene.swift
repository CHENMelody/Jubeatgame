//
//  GameScene.swift
//  Jubeatgame
//
//  Created by 心怡陳 on 2016/5/28.
//  Copyright (c) 2016年 心怡陳. All rights reserved.
//

import SpriteKit


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
        self.physicsWorld.gravity = CGVectorMake(0,0);
        self.physicsWorld.contactDelegate = self
        
        background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        for(var i = 1;i<=13;i++){
            let texturename = "touch\(i)"
            texturearray.append(SKTexture(imageNamed: texturename))
        }
//        touch = SKSpriteNode(imageNamed: "touch1")
//        touch.position = CGPoint(x: 360 + 300 , y:100 + 300)

        for(var i = 0;i<16;i++){
            touch = SKSpriteNode(imageNamed: "touch1")
            touch.position = CGPoint(x: 360 + ((i%4)*100) , y:100 + ((i/4)*100))
            touch.size = CGSizeMake(90, 90)
            touch.physicsBody = SKPhysicsBody(circleOfRadius:
                (touch.size.width))
            
            touch.physicsBody?.categoryBitMask = PhysicsCatagory.Brick
            touch.physicsBody?.contactTestBitMask = PhysicsCatagory.Check
            touch.physicsBody?.collisionBitMask = PhysicsCatagory.Check
            token.physicsBody?.dynamic = false
            touch.name = "brick"
            toucharray.append(touch)
            
            self.addChild(toucharray[i])
            toucharray[i].runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(texturearray, timePerFrame:0.05)))
        }

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let action = SKAction.rotateByAngle(0, duration:1)
            let doneaction = SKAction.removeFromParent()
            
            token = SKSpriteNode(imageNamed: "token")
            token.physicsBody = SKPhysicsBody(circleOfRadius:
                (token.size.width/2))
            token.position = CGPoint(x: location.x , y: location.y)
            token.physicsBody?.categoryBitMask = PhysicsCatagory.Check
            token.physicsBody?.contactTestBitMask = PhysicsCatagory.Brick
            token.physicsBody?.collisionBitMask = 0

            token.name = "token"
            token.physicsBody?.dynamic = true


            token.runAction(SKAction.sequence([action,doneaction]))
            self.addChild(token)
            
        }
 
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
       
        
    }
    func didBeginContact(contact: SKPhysicsContact) {
        let firstbody = contact.bodyA.node as! SKSpriteNode
        let secondbody = contact.bodyB.node as! SKSpriteNode

        
        if( ((firstbody.name == "brick" ) && ( secondbody.name == "token")) ){
//            firstbody.removeFromParent()
//            secondbody.removeFromParent()
            print("bomb\n");
        }
        else if (((firstbody.name == "token" ) && (secondbody.name == "brick ")) ){
            print("nothing!\n")
        
        }
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
 