//
//  ViewController.swift
//  塔罗牌
//
//  Created by 123 on 15/11/13.
//  Copyright © 2015年 123. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var blackgroundImage1 = UIView?()
    override func viewDidLoad() {
    super.viewDidLoad()
        let max: UInt32 = 254
        let min: UInt32 = 0
        let Cred:CGFloat=CGFloat(arc4random_uniform(max - min) + min)
        let Cblue:CGFloat=CGFloat(arc4random_uniform(max - min) + min)
        let Cgreen:CGFloat=CGFloat(arc4random_uniform(max - min) + min)
        
       
        print(mainBundlePath.pathForResource("0愚人前", ofType: "png"))
        
        let image="beginImage_1.jpg"
        //let image=mainBundlePath.pathForResource("beginImage_1", ofType: "jpg")
        let button_background = UIButton(frame:CGRectMake(0, 0, screenBounds.width, screenBounds.height))
        button_background.setBackgroundImage(UIImage(named: image), forState: UIControlState.Normal)
        
        let button_1 = UIButton(frame:CGRectMake(0, 0, screenBounds.width, screenBounds.height))
        button_1.setTitle("请保持镇定", forState:UIControlState.Normal)
        button_1.setTitle("Ready Go!", forState:UIControlState.Highlighted)
        button_1.setTitleColor(UIColor(red: Cred, green: Cgreen, blue: Cblue, alpha: 1),forState: .Normal)
        button_1.setTitleColor(UIColor.redColor(),forState: .Highlighted)
        button_1.addTarget(self, action: Selector("tapped"), forControlEvents: UIControlEvents.TouchUpInside)
        
        button_background.addTarget(self, action: Selector("tapped"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button_background)
        self.view.addSubview(button_1)
    }
    func tapped(){
        let anotherUI=GameUpload()
        self.presentViewController(anotherUI, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

