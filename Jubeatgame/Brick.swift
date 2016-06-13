//
//  Brick.swift
//  Jubeatgame
//
//  Created by killerhi2001 on 2016/6/5.
//  Copyright © 2016年 心怡陳. All rights reserved.
//

import UIKit
import SpriteKit


class Brick: SKSpriteNode {
    var texturearray = [SKTexture]()
    var brickarray = [Brick]()
    var showaction : SKAction!
    var doneaction : SKAction!
    var unionaction: SKAction!
    var waitaction : SKAction!
    var positionarray = BrickPosition()
    var isPreparetoNextMode : Bool!
    var isCombo : Bool!
    var index :Int!
    var combo: Int!
    
//    var brick1 = Brick()

    init(){
//        let texture = SKTexture(imageNamed: "brick0")
        let texture = SKTexture(imageNamed: "brick0")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        self.position = CGPointMake(360, 100)
        self.alpha = 0.0
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(40, 40))
//        self.physicsBody = nil
        self.size = CGSizeMake(83, 83)
        self.color = UIColor.blueColor()
        self.physicsBody?.categoryBitMask = PhysicsCatagory.Brick
        self.physicsBody?.contactTestBitMask = PhysicsCatagory.Check
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.dynamic = false
        self.name = "space"
        self.isCombo = false
        self.combo = 0
        makeTexturearray()
        Setaction()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeTexturearray(){
        for(var i = 0;i<=9;i++){
            let texturename = "brick\(i)"
            texturearray.append(SKTexture(imageNamed: texturename))
        }
        
    }
    
    func makeBrickArray(){
//        let tmpbrick = Brick()
        
        for i in 0 ..< 16 {
            self.brickarray.append(Brick())
            self.brickarray[i].index = i
            self.brickarray[i].position = self.positionarray.BrickPositionArray[i]
        }
        self.brickarray.append(Brick())
        self.brickarray[16].position = CGPointMake(960, 100)
        
    }
    func Setaction(){
        self.showaction = SKAction.animateWithTextures(texturearray, timePerFrame: 0.1)
        self.doneaction = SKAction.runBlock({
            self.physicsBody = nil
            self.removeFromParent()
        })
        self.waitaction = SKAction.waitForDuration(1)
    }

    func mode1(){

        let cancelaction = SKAction.runBlock({
            
            self.brickarray[3].name = "space"
            
            if(self.brickarray[3].isCombo == true){
                self.combo = self.combo + 1
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
//            self.brickarray[5].isCombo = false
            
            for i in 0 ..< 16 {
                self.brickarray[i].removeFromParent()
            }
            self.isPreparetoNextMode = true
        })
        let act1 = SKAction.runBlock({
            self.brickarray[0].isCombo = false
            self.brickarray[0].name = "brick"
            self.brickarray[0].runAction(self.showaction)
            
        })
        let act2 = SKAction.runBlock({
            self.brickarray[0].name = "space"
            
            if(self.brickarray[0].isCombo == true){
                self.combo = self.combo + 1
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[5].isCombo = false
            self.brickarray[5].name = "brick"
            self.brickarray[5].runAction(self.showaction)
        })
        let act3 = SKAction.runBlock({
            
            self.brickarray[5].name = "space"
            
            if(self.brickarray[5].isCombo == true){
                self.combo = self.combo + 1
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[10].isCombo = false
            self.brickarray[10].name = "brick"
            self.brickarray[10].runAction(self.showaction)
        })
        let act4 = SKAction.runBlock({
            self.brickarray[10].name = "space"
            
            
            if(self.brickarray[10].isCombo == true){
                self.combo = self.combo + 1
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[15].isCombo = false
            self.brickarray[15].name = "brick"
            self.brickarray[15].runAction(self.showaction)
        })
        let act5 = SKAction.runBlock({
            
            self.brickarray[15].name = "space"
            
            if(self.brickarray[15].isCombo == true){
                self.combo = self.combo + 1
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[12].isCombo = false
            self.brickarray[12].name = "brick"
            self.brickarray[12].runAction(self.showaction)
        })
        
        let act6 = SKAction.runBlock({
            
            self.brickarray[12].name = "space"
            
            if(self.brickarray[12].isCombo == true){
                self.combo = self.combo + 1
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[9].isCombo = false
            self.brickarray[9].name = "brick"
            self.brickarray[9].runAction(self.showaction)
        })
        
        let act7 = SKAction.runBlock({
            
            self.brickarray[9].name = "space"
            
            if(self.brickarray[9].isCombo == true){
                self.combo = self.combo + 1
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[6].isCombo = false
            self.brickarray[6].name = "brick"
            self.brickarray[6].runAction(self.showaction)
        })
        
        let act8 = SKAction.runBlock({
            
            self.brickarray[6].name = "space"
            
            
            if(self.brickarray[6].isCombo == true){
                self.combo = self.combo + 1
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[3].isCombo = false
            self.brickarray[3].name = "brick"
            self.brickarray[3].runAction(self.showaction)
        })
        self.unionaction =  SKAction.sequence([act1,waitaction,act2,waitaction,act3,waitaction,act4,waitaction,act5,waitaction,act6,waitaction,act7,waitaction,act8,waitaction,cancelaction])
        self.brickarray[16].runAction(unionaction)
        self.brickarray[16].name = "space"
    }
    
    func mode2(){
        
//        let waitaction = SKAction.waitForDuration(1)
        let cancelaction = SKAction.runBlock({
            self.brickarray[0].name = "space"
            self.brickarray[3].name = "space"
            if(self.brickarray[0].isCombo == true && self.brickarray[3].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
//            self.brickarray[0].isCombo = false
//            self.brickarray[3].isCombo = false

            
            for i in 0 ..< 16 {
                self.brickarray[i].removeFromParent()
            }
            self.isPreparetoNextMode = true
        })
        let act1 = SKAction.runBlock({
            
            
            self.brickarray[1].isCombo = false
            self.brickarray[2].isCombo = false
            self.brickarray[1].name = "brick"
            self.brickarray[1].runAction(self.showaction)
            self.brickarray[2].name = "brick"
            self.brickarray[2].runAction(self.showaction)
            
        })
        let act2 = SKAction.runBlock({
            
            self.brickarray[1].name = "space"
            self.brickarray[2].name = "space"
            if(self.brickarray[1].isCombo == true && self.brickarray[2].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[5].isCombo = false
            self.brickarray[6].isCombo = false
            
            self.brickarray[5].name = "brick"
            self.brickarray[5].runAction(self.showaction)
            self.brickarray[6].name = "brick"
            self.brickarray[6].runAction(self.showaction)
        })
        let act3 = SKAction.runBlock({
            self.brickarray[5].name = "space"
            self.brickarray[6].name = "space"
            if(self.brickarray[5].isCombo == true && self.brickarray[6].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[9].isCombo = false
            self.brickarray[10].isCombo = false
            self.brickarray[9].name = "brick"
            self.brickarray[9].runAction(self.showaction)
            self.brickarray[10].name = "brick"
            self.brickarray[10].runAction(self.showaction)
        })
        let act4 = SKAction.runBlock({
            self.brickarray[9].name = "space"
            self.brickarray[10].name = "space"
            if(self.brickarray[9].isCombo == true && self.brickarray[10].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[13].isCombo = false
            self.brickarray[14].isCombo = false
            self.brickarray[13].name = "brick"
            self.brickarray[13].runAction(self.showaction)
            self.brickarray[14].name = "brick"
            self.brickarray[14].runAction(self.showaction)
        })
        let act5 = SKAction.runBlock({
            self.brickarray[13].name = "space"
            self.brickarray[14].name = "space"
            if(self.brickarray[13].isCombo == true && self.brickarray[14].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[12].isCombo = false
            self.brickarray[15].isCombo = false
            self.brickarray[12].name = "brick"
            self.brickarray[12].runAction(self.showaction)
            self.brickarray[15].name = "brick"
            self.brickarray[15].runAction(self.showaction)
        })
        
        let act6 = SKAction.runBlock({
            self.brickarray[12].name = "space"
            self.brickarray[15].name = "space"
            if(self.brickarray[12].isCombo == true && self.brickarray[15].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[8].isCombo = false
            self.brickarray[11].isCombo = false

            self.brickarray[8].name = "brick"
            self.brickarray[8].runAction(self.showaction)
            self.brickarray[11].name = "brick"
            self.brickarray[11].runAction(self.showaction)
        })
        
        let act7 = SKAction.runBlock({
            self.brickarray[8].name = "space"
            self.brickarray[11].name = "space"
            if(self.brickarray[8].isCombo == true && self.brickarray[11].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[4].isCombo = false
            self.brickarray[7].isCombo = false

            self.brickarray[4].name = "brick"
            self.brickarray[4].runAction(self.showaction)
            self.brickarray[7].name = "brick"
            self.brickarray[7].runAction(self.showaction)
        })
        
        let act8 = SKAction.runBlock({
            self.brickarray[4].name = "space"
            self.brickarray[7].name = "space"
            
            if(self.brickarray[4].isCombo == true && self.brickarray[7].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[0].isCombo = false
            self.brickarray[3].isCombo = false

            self.brickarray[0].name = "brick"
            self.brickarray[0].runAction(self.showaction)
            self.brickarray[3].name = "brick"
            self.brickarray[3].runAction(self.showaction)
        })
        self.unionaction =  SKAction.sequence([act1,waitaction,act2,waitaction,act3,waitaction,act4,waitaction,act5,waitaction,act6,waitaction,act7,waitaction,act8,waitaction,cancelaction])
        self.brickarray[16].runAction(unionaction)
    }
    
    func mode3(){
        
        //        let waitaction = SKAction.waitForDuration(1)
        let cancelaction = SKAction.runBlock({
            self.brickarray[0].name = "space"
            self.brickarray[3].name = "space"
            if(self.brickarray[0].isCombo == true && self.brickarray[3].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
//            self.brickarray[0].isCombo = false
//            self.brickarray[3].isCombo = false
            
            
            for i in 0 ..< 16 {
                self.brickarray[i].removeFromParent()
            }
            self.isPreparetoNextMode = true
        })
        let act1 = SKAction.runBlock({
            
            
            self.brickarray[2].isCombo = false
            self.brickarray[8].isCombo = false
            self.brickarray[2].name = "brick"
            self.brickarray[8].name = "brick"
            
            self.brickarray[2].runAction(self.showaction)
            self.brickarray[8].runAction(self.showaction)
            
        })
        let act2 = SKAction.runBlock({
            
            self.brickarray[2].name = "space"
            self.brickarray[8].name = "space"
            if(self.brickarray[2].isCombo == true && self.brickarray[8].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[1].isCombo = false
            self.brickarray[11].isCombo = false
            
            self.brickarray[1].name = "brick"
            self.brickarray[11].name = "brick"
            self.brickarray[1].runAction(self.showaction)
            self.brickarray[11].runAction(self.showaction)
        })
        let act3 = SKAction.runBlock({
            self.brickarray[1].name = "space"
            self.brickarray[11].name = "space"
            if(self.brickarray[1].isCombo == true && self.brickarray[11].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[5].isCombo = false
            self.brickarray[6].isCombo = false
            self.brickarray[5].name = "brick"
            self.brickarray[6].name = "brick"
            
            self.brickarray[5].runAction(self.showaction)
            self.brickarray[6].runAction(self.showaction)
        })
        let act4 = SKAction.runBlock({
            self.brickarray[5].name = "space"
            self.brickarray[6].name = "space"
            if(self.brickarray[5].isCombo == true && self.brickarray[6].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[4].isCombo = false
            self.brickarray[15].isCombo = false
            self.brickarray[4].name = "brick"
            self.brickarray[15].name = "brick"
            self.brickarray[4].runAction(self.showaction)
            self.brickarray[15].runAction(self.showaction)
        })
        let act5 = SKAction.runBlock({
            self.brickarray[4].name = "space"
            self.brickarray[15].name = "space"
            if(self.brickarray[4].isCombo == true && self.brickarray[15].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[7].isCombo = false
            self.brickarray[12].isCombo = false
            self.brickarray[7].name = "brick"
            self.brickarray[12].name = "brick"
            self.brickarray[7].runAction(self.showaction)
            self.brickarray[12].runAction(self.showaction)
        })
        
        let act6 = SKAction.runBlock({
            self.brickarray[7].name = "space"
            self.brickarray[12].name = "space"
            if(self.brickarray[7].isCombo == true && self.brickarray[12].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[2].isCombo = false
            self.brickarray[8].isCombo = false
            self.brickarray[2].name = "brick"
            self.brickarray[8].name = "brick"
            self.brickarray[2].runAction(self.showaction)
            self.brickarray[8].runAction(self.showaction)
        })
        
        let act7 = SKAction.runBlock({
            self.brickarray[2].name = "space"
            self.brickarray[8].name = "space"
            if(self.brickarray[2].isCombo == true && self.brickarray[8].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[5].isCombo = false
            self.brickarray[6].isCombo = false
            self.brickarray[5].name = "brick"
            self.brickarray[6].name = "brick"
            self.brickarray[5].runAction(self.showaction)
            self.brickarray[6].runAction(self.showaction)
        })
        
        let act8 = SKAction.runBlock({
            self.brickarray[5].name = "space"
            self.brickarray[6].name = "space"
            
            if(self.brickarray[5].isCombo == true && self.brickarray[6].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[0].isCombo = false
            self.brickarray[3].isCombo = false
            
            self.brickarray[0].name = "brick"
            self.brickarray[3].name = "brick"
            
            self.brickarray[0].runAction(self.showaction)
            self.brickarray[3].runAction(self.showaction)
        })
        self.unionaction =  SKAction.sequence([act1,waitaction,act2,waitaction,act3,waitaction,act4,waitaction,act5,waitaction,act6,waitaction,act7,waitaction,act8,waitaction,cancelaction])
        runAction(unionaction)
    }

    func mode4(){
        
        //        let waitaction = SKAction.waitForDuration(1)
        let cancelaction = SKAction.runBlock({
            self.brickarray[0].name = "space"
            self.brickarray[3].name = "space"
            if(self.brickarray[0].isCombo == true && self.brickarray[3].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            //            self.brickarray[0].isCombo = false
            //            self.brickarray[3].isCombo = false
            
            
            for i in 0 ..< 16 {
                self.brickarray[i].removeFromParent()
            }
            self.isPreparetoNextMode = true
        })
        let act1 = SKAction.runBlock({
            
            
            self.brickarray[2].isCombo = false
            self.brickarray[8].isCombo = false
            self.brickarray[2].name = "brick"
            self.brickarray[8].name = "brick"
            
            self.brickarray[2].runAction(self.showaction)
            self.brickarray[8].runAction(self.showaction)
            
        })
        let act2 = SKAction.runBlock({
            
            self.brickarray[2].name = "space"
            self.brickarray[8].name = "space"
            if(self.brickarray[2].isCombo == true && self.brickarray[8].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[1].isCombo = false
            self.brickarray[11].isCombo = false
            
            self.brickarray[1].name = "brick"
            self.brickarray[11].name = "brick"
            self.brickarray[1].runAction(self.showaction)
            self.brickarray[11].runAction(self.showaction)
        })
        let act3 = SKAction.runBlock({
            self.brickarray[1].name = "space"
            self.brickarray[11].name = "space"
            if(self.brickarray[1].isCombo == true && self.brickarray[11].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[5].isCombo = false
            self.brickarray[6].isCombo = false
            self.brickarray[5].name = "brick"
            self.brickarray[6].name = "brick"
            
            self.brickarray[5].runAction(self.showaction)
            self.brickarray[6].runAction(self.showaction)
        })
        let act4 = SKAction.runBlock({
            self.brickarray[5].name = "space"
            self.brickarray[6].name = "space"
            if(self.brickarray[5].isCombo == true && self.brickarray[6].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[4].isCombo = false
            self.brickarray[15].isCombo = false
            self.brickarray[4].name = "brick"
            self.brickarray[15].name = "brick"
            self.brickarray[4].runAction(self.showaction)
            self.brickarray[15].runAction(self.showaction)
        })
        let act5 = SKAction.runBlock({
            self.brickarray[4].name = "space"
            self.brickarray[15].name = "space"
            if(self.brickarray[4].isCombo == true && self.brickarray[15].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[7].isCombo = false
            self.brickarray[12].isCombo = false
            self.brickarray[7].name = "brick"
            self.brickarray[12].name = "brick"
            self.brickarray[7].runAction(self.showaction)
            self.brickarray[12].runAction(self.showaction)
        })
        
        let act6 = SKAction.runBlock({
            self.brickarray[7].name = "space"
            self.brickarray[12].name = "space"
            if(self.brickarray[7].isCombo == true && self.brickarray[12].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[2].isCombo = false
            self.brickarray[8].isCombo = false
            self.brickarray[2].name = "brick"
            self.brickarray[8].name = "brick"
            self.brickarray[2].runAction(self.showaction)
            self.brickarray[8].runAction(self.showaction)
        })
        
        let act7 = SKAction.runBlock({
            self.brickarray[2].name = "space"
            self.brickarray[8].name = "space"
            if(self.brickarray[2].isCombo == true && self.brickarray[8].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[5].isCombo = false
            self.brickarray[6].isCombo = false
            self.brickarray[5].name = "brick"
            self.brickarray[6].name = "brick"
            self.brickarray[5].runAction(self.showaction)
            self.brickarray[6].runAction(self.showaction)
        })
        
        let act8 = SKAction.runBlock({
            self.brickarray[5].name = "space"
            self.brickarray[6].name = "space"
            
            if(self.brickarray[5].isCombo == true && self.brickarray[6].isCombo == true ){
                self.combo = self.combo + 2
                self.isCombo = true
            }
            else{
                self.combo = 0
                self.isCombo = false
            }
            
            self.brickarray[0].isCombo = false
            self.brickarray[3].isCombo = false
            
            self.brickarray[0].name = "brick"
            self.brickarray[3].name = "brick"
            
            self.brickarray[0].runAction(self.showaction)
            self.brickarray[3].runAction(self.showaction)
        })
        self.unionaction =  SKAction.sequence([act1,waitaction,act2,waitaction,act3,waitaction,act4,waitaction,act5,waitaction,act6,waitaction,act7,waitaction,act8,waitaction,cancelaction])
        runAction(unionaction)
    }

}

