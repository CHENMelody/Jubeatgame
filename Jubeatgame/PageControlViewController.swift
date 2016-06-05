//
//  PageControlViewController.swift
//  Jubeatgame
//
//  Created by 心怡陳 on 2016/5/30.
//  Copyright © 2016年 心怡陳. All rights reserved.
//

import UIKit
import AVFoundation

class PageControlViewController: UIViewController , AVAudioPlayerDelegate{
    @IBOutlet var RightSwipe1: UISwipeGestureRecognizer!
    @IBOutlet var LeftSwipe1: UISwipeGestureRecognizer!
    
    @IBOutlet weak var MyImg: UIImageView!
    @IBOutlet weak var MypageControl: UIPageControl!
   
    //Level
    @IBOutlet weak var StarImg_LV1: UIImageView!
    @IBOutlet weak var StarImg_LV2: UIImageView!
    @IBOutlet weak var StarImg_LV3: UIImageView!
    @IBOutlet weak var StarImg_LV4: UIImageView!
    @IBOutlet weak var StarImg_LV5: UIImageView!

    @IBAction func gameStartButton(sender: AnyObject) {
         self.performSegueWithIdentifier("toGameView", sender: self)
    }

    var ImgArr = []
    var nameArr = []
    var Level :Int = 1
    var audioPlayer:AVAudioPlayer!
    
    
    func showImg(){
        let filename = ImgArr[self.MypageControl.currentPage]
        self.MyImg.image = UIImage(named: filename as! String)
        
    }
    
    @IBAction func SwipeControl(sender: UISwipeGestureRecognizer) {
   
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.Left:
            if self.MypageControl.currentPage < ImgArr.count {
                self.MypageControl.currentPage++
                self.showImg()
            }
        case UISwipeGestureRecognizerDirection.Right:
            if self.MypageControl.currentPage > 0 {
                self.MypageControl.currentPage--
                self.showImg()
            }
        default:
            break
        }

    }
    
    //******play music******//
    @IBAction func play(sender: AnyObject) {
        audioPlayer.play()
    }
    
    //******stop music******//
    @IBAction func pause(sender: AnyObject) {
        audioPlayer.pause()
    }
    
    //******Level******//
    @IBAction func L1Button(sender: AnyObject) {
        Level = 1
        StarImg_LV1.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV2.image = UIImage(named: "murkyStar-icon.jpg")
        StarImg_LV3.image = UIImage(named: "murkyStar-icon.jpg")
        StarImg_LV4.image = UIImage(named: "murkyStar-icon.jpg")
        StarImg_LV5.image = UIImage(named: "murkyStar-icon.jpg")
    }
    @IBAction func L2Button(sender: AnyObject) {
        Level = 2
        StarImg_LV1.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV2.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV3.image = UIImage(named: "murkyStar-icon.jpg")
        StarImg_LV4.image = UIImage(named: "murkyStar-icon.jpg")
        StarImg_LV5.image = UIImage(named: "murkyStar-icon.jpg")
    }
    @IBAction func L3Button(sender: AnyObject) {
        Level = 3
        StarImg_LV1.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV2.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV3.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV4.image = UIImage(named: "murkyStar-icon.jpg")
        StarImg_LV5.image = UIImage(named: "murkyStar-icon.jpg")
    }
    @IBAction func L4Button(sender: AnyObject) {
        Level = 4
        StarImg_LV1.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV2.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV3.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV4.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV5.image = UIImage(named: "murkyStar-icon.jpg")
    }
    @IBAction func L5Button(sender: AnyObject) {
        Level = 5
        StarImg_LV1.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV2.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV3.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV4.image = UIImage(named: "ShiningStar-icon.jpg")
        StarImg_LV5.image = UIImage(named: "ShiningStar-icon.jpg")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImgArr = ["img1.jpg","img2.jpg","img3.jpg"]
        nameArr = ["name1","name2","name3"]

        self.MypageControl.numberOfPages = ImgArr.count
        self.showImg()
        
        //page control hidding
        MypageControl.hidden=true
        
        //******music player******//
        let path = NSBundle.mainBundle().pathForResource("song", ofType: "mp3")
        let fileData = NSData(contentsOfFile: path!)
        audioPlayer = try!AVAudioPlayer(data: fileData!)
        self.audioPlayer.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //Passing data to GameViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toGameView" {
            
            let destinationController  =  segue.destinationViewController as! GameViewController
            destinationController.Level   = self.Level
            destinationController.ImgName = ImgArr[self.MypageControl.currentPage] as! String
            destinationController.Song    = self.nameArr[self.MypageControl.currentPage] as! String
        }
    }

}
