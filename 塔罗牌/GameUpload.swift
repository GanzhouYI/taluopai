//
//  GameUpload.swift
//  塔罗牌
//
//  Created by 123 on 15/11/18.
//  Copyright © 2015年 123. All rights reserved.
//

import UIKit

class GameUpload: UIViewController {
    
        let image="beginImage_2.jpg"
        override func loadView() {
            super.loadView()
    
            let imageView=UIImageView()//背景
            imageView.frame=self.view.frame
            imageView.image=UIImage(named: image)
            imageView.contentMode=UIViewContentMode.ScaleToFill
            self.view.addSubview(imageView)
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button_zhanbu = UIButton(frame: CGRectMake(self.view.bounds.width*3/5,self.view.bounds.height*5/8,self.view.bounds.width*3/10,self.view.bounds.height*3/64))
        button_zhanbu.setTitle("占卜", forState: UIControlState.Normal)
        button_zhanbu.setTitle("Ready Go!", forState:UIControlState.Highlighted)
        button_zhanbu.layer.cornerRadius = 20
        button_zhanbu.layer.borderWidth = 2
        button_zhanbu.layer.borderColor = UIColor.whiteColor().CGColor

        
        button_zhanbu.setTitleColor(UIColor.whiteColor(),forState: .Normal)
        button_zhanbu.setTitleColor(UIColor.whiteColor(),forState: .Highlighted)
        button_zhanbu.addTarget(self, action: Selector("tapped"), forControlEvents: UIControlEvents.TouchUpInside)

        let button_kapaijianshan = UIButton(frame: CGRectMake(self.view.bounds.width*3/5,self.view.bounds.height*(5/8+3/64),self.view.bounds.width*3/10,self.view.bounds.height*3/64))
        button_kapaijianshan.setTitle("卡牌鉴赏", forState: UIControlState.Normal)
        button_kapaijianshan.layer.cornerRadius = 20
        button_kapaijianshan.layer.borderWidth = 1
        button_kapaijianshan.layer.borderColor = UIColor.whiteColor().CGColor
        button_kapaijianshan.setTitleColor(UIColor.whiteColor(),forState: .Normal)
        button_kapaijianshan.addTarget(self, action: Selector("button_kapaijianshan"), forControlEvents: UIControlEvents.TouchUpInside)
        
        let button_detail = UIButton(frame: CGRectMake(self.view.bounds.width*3/5,self.view.bounds.height*(5/8+6/64),self.view.bounds.width*3/10,self.view.bounds.height*3/64))
        button_detail.setTitle("更多卡牌信息", forState: UIControlState.Normal)
        button_detail.layer.cornerRadius = 20
        button_detail.layer.borderWidth = 2
        button_detail.layer.borderColor = UIColor.whiteColor().CGColor
        button_detail.setTitleColor(UIColor.whiteColor(),forState: .Normal)
        button_detail.addTarget(self, action: Selector("button_detail"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button_zhanbu)
        self.view.addSubview(button_kapaijianshan)
       // self.view.addSubview(button_detail)
    }
    func tapped(){
        if #available(iOS 8.0, *) {
            let anotherUI=Play()
        } else {
            // Fallback on earlier versions
        }
        init_suiji()//随机生成
        systemSound("按键")
            self.presentViewController(Play(), animated: true, completion: nil)
    }
    
    func button_detail(sender:AnyObject)
    {   //读取网页
//        let alertView = UIAlertController(title: "文本为空", message: "您输入的文本为空", preferredStyle: UIAlertControllerStyle.Alert)
//        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
//        alertView.addAction(cancelAction)
//        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
    func button_kapaijianshan()
    {
        systemSound("按键")
        let nav = UINavigationController(rootViewController: kapaijianshan())
        //self.window?.rootViewController=nav
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
