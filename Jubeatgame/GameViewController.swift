//
//  GameViewController.swift
//  Jubeatgame
//
//  Created by 心怡陳 on 2016/5/28.
//  Copyright (c) 2016年 心怡陳. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation


class GameViewController: UIViewController ,AVAudioPlayerDelegate{

    var audioPlayer : AVAudioPlayer!
//    var timer : NSTimer!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // play music
        let path = NSBundle.mainBundle().pathForResource("piano", ofType: "mp3")
        let fileData = NSData(contentsOfFile: path!)
        audioPlayer = try! AVAudioPlayer(data: fileData!)
        
        self.audioPlayer.delegate = self
        
        if(audioPlayer != nil){
            if(audioPlayer.prepareToPlay()){
                self.audioPlayer.play()
//                timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self,selector:Selector("ProduceBrick"), userInfo: nil,repeats: true)
            }
        }
        
        ///----end
        
       
        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.

            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    func ProduceBrick(){
        print("1s 1 brick")
    
    }

}
