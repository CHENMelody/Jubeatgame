//
//  recordViewController.swift
//  Jubeatgame
//
//  Created by 心怡陳 on 2016/6/5.
//  Copyright © 2016年 心怡陳. All rights reserved.
//

import UIKit

class recordViewController: UIViewController {
   
    
    @IBAction func playAgain(sender: AnyObject) {
        self.performSegueWithIdentifier("backToHomePageView", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //background setting
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "background")
        self.view.insertSubview(backgroundImage, atIndex: 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "backToHomePageView" {
            
             let destinationController  =  segue.destinationViewController as! PageControlViewController
        }
    }


}
