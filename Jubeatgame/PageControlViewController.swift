//
//  PageControlViewController.swift
//  Jubeatgame
//
//  Created by 心怡陳 on 2016/5/30.
//  Copyright © 2016年 心怡陳. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController {
    @IBOutlet var RightSwipe1: UISwipeGestureRecognizer!
    @IBOutlet var LeftSwipe1: UISwipeGestureRecognizer!
    
    @IBOutlet weak var MyImg: UIImageView!
    @IBOutlet weak var MypageControl: UIPageControl!
    
    var ImgArr = []
    func showImg(){
        let filename = ImgArr[self.MypageControl.currentPage]
        self.MyImg.image = UIImage(named: filename as! String)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImgArr = ["img1.jpg","img2.jpg","img3.jpg"]
        self.MypageControl.numberOfPages = ImgArr.count
        self.showImg()
        MypageControl.hidden=true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

}
