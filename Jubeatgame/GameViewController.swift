//
//  GameViewController.swift
//  Jubeatgame
//
//  Created by 心怡陳 on 2016/5/28.
//  Copyright (c) 2016年 心怡陳. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {

    var Level   :Int = 1
    var ImgName :String = ""
    var Song    :String = ""
    @IBOutlet weak var AlbumCover: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            
            //set Album Cover's image
            self.AlbumCover.image = UIImage(named: ImgName as! String)
            
            //output testing
            print("Level = \(Level)")
            print("ImgName = \(ImgName)")
            print("Song = \(Song)")
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
    
    
    //Passing data to next page
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "toRecordview" {

        }
        
        
    }
}
