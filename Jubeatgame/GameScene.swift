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
    var score :UInt32 = 0
    var token = SKSpriteNode()
    var scoreNode = SKLabelNode()
    var comboNode = SKLabelNode()
    var background = SKSpriteNode()
    var texturearray = [SKTexture]()
    var NumbertextureArray = [SKTexture]()
    var touchcount = 0
    var toucharray = [SKSpriteNode]()
    var timer = NSTimer!()
    var bricks = Brick()
    var positonarray = BrickPosition()
    var mode = 0
    var time = CFTimeInterval(0)
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

        let brickground = SKSpriteNode(imageNamed: "brickbackground")
        brickground.size = CGSizeMake(420 ,420)
        brickground.position = CGPointMake(512, 200)
        brickground.zPosition = -1
        self.addChild(brickground)

        self.view?.multipleTouchEnabled = true
        self.backgroundColor = SKColor.clearColor()
//        self.physicsWorld.gravity = CGVectorMake(0,0);
        self.physicsWorld.contactDelegate = self
        self.addChild(bricks)
        scoreNode.position = CGPointMake(500, 450)
        self.addChild(scoreNode)
        comboNode.position = CGPointMake(500,550)
        self.addChild(comboNode)
        bricks.makeBrickArray()
        
        self.addChild(bricks.brickarray[16])
        bricks.isPreparetoNextMode = true
        
        
        
        
        
//        RandomProduceBrick()
        
        
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let action = SKAction.rotateByAngle(360, duration:1)
            let doneaction = SKAction.removeFromParent()
            token = Jpoint()
            token.position = location
//            print("\(token.physicsBody?.categoryBitMask)")
            self.addChild(token)
            token.runAction(SKAction.sequence([action,doneaction]))
            
        }
    }
   
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    func didBeginContact(contact: SKPhysicsContact) {
        let firstbody = contact.bodyA.node as! Brick
        let secondbody = contact.bodyB.node as! SKSpriteNode
        
       
        if( ((firstbody.name == "brick" ) && ( secondbody.name == "Jpoint")) ){
//            firstbody.removeFromParent()
            let BrickTextureName = firstbody.texture?.description
            let range = Range(start: BrickTextureName!.startIndex.advancedBy(18), end: BrickTextureName!.startIndex.advancedBy(19))
            let imgscore = Int((BrickTextureName?.substringWithRange(range))! )! + 1
            
            firstbody.isCombo = true
//            print("b:\(bricks.isCombo)")
//            print("\(firstbody.name)")
            if(bricks.combo != 0){
                comboNode.text = "\(bricks.combo)"
            }
            score = UInt32((5 - abs(imgscore - 5) ) * 100) + score
            scoreNode.text = "\(score)"
        }
        
//        else if (((firstbody.name == "Jpoint" ) && (secondbody.name == "brick ")) ){
//            print("nothing!\n")
//            
//        }
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        time = time + 1
        if(time % 60 == 0){
//            print("\(time)")
//            print("\(currentTime)")
            if(bricks.isCombo == false){
                comboNode.text = ""
                bricks.combo = 0
                
            }
            
        }

        if(bricks.isPreparetoNextMode == true){
            bricks.isPreparetoNextMode = false
            for i in 0 ..< 16 {
                bricks.brickarray[i].alpha = 1
                self.addChild(bricks.brickarray[i])
            }
            self.mode = Int(arc4random_uniform(3) )
            if(self.mode == 0){
                bricks.mode1()
            }
            else if(self.mode == 1){
                bricks.mode2()
            }
            else if(self.mode == 2){
                bricks.mode3()
            }
                
            else{
                bricks.isPreparetoNextMode = true
            }
        }
    
    
    }
    
    func RandomProduceBrick(){
        let action1 = SKAction.repeatActionForever(SKAction.animateWithTextures(bricks.texturearray, timePerFrame: 0.1))
        for i in 0...15{
            self.addChild(bricks.brickarray[i])
            self.bricks.brickarray[i].runAction(action1)
        }

    }

}