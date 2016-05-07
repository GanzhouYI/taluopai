//
//  ViewController.swift
//  塔罗牌
//
//  Created by 123 on 15/11/13.
//  Copyright © 2015年 123. All rights reserved.
//
import UIKit

class kapaijianshan_detail: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kapai_jianshan_SQL(self.title!)
        //按title加载卡牌信息
        loadIntroduce(self.title!)

        //设置代码和效果展示切换，增加导航条的右上角按钮
        let btn = UIBarButtonItem(title: "详细", style: UIBarButtonItemStyle.Plain, target: self, action: "btnClicked:")
        self.navigationItem.rightBarButtonItem = btn
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadIntroduce(ctrl:String)
    {
        self.view.backgroundColor = UIColor.purpleColor()
        var num = 0
        for ct in  kapai_names
        {
            if ct == ctrl
            {
                let image = UIImageView(frame: CGRectMake(self.view.bounds.width*0.2692, self.view.bounds.height*0.0526, self.view.bounds.width*0.4615, self.view.bounds.height*0.6316))
                image.image = UIImage(named: "\(imagePath[num]).png")
                
                let label_star = UILabel(frame: CGRectMake(0,self.view.frame.height*0.6842,self.view.frame.width*2/10,self.view.frame.height*0.0395))
                label_star.text = "象征星座:"
                label_star.layer.borderColor = UIColor.whiteColor().CGColor
                label_star.layer.borderWidth = 1
                label_star.textColor = UIColor.whiteColor()
                label_star.backgroundColor = UIColor.purpleColor()
                
                let label_star_name = UILabel(frame: CGRectMake(self.view.frame.width*2/10,self.view.frame.height*0.6842,self.view.frame.width*3/10,self.view.frame.height*0.0395))
                label_star_name.text = SQL_star_name as String
                label_star_name.layer.borderColor = UIColor.whiteColor().CGColor
                label_star_name.layer.borderWidth = 2
                label_star_name.textAlignment = NSTextAlignment.Center
                label_star_name.textColor = UIColor.yellowColor()
                label_star_name.backgroundColor = UIColor.purpleColor()
                
                let label_keyworld = UILabel(frame: CGRectMake(self.view.frame.width*5/10,self.view.frame.height*0.6842,self.view.frame.width*2/10,self.view.frame.height*0.0395))
                label_keyworld.text = "关键词:"
                label_keyworld.textAlignment = NSTextAlignment.Center
                label_keyworld.layer.borderColor = UIColor.whiteColor().CGColor
                label_keyworld.layer.borderWidth = 1
                label_keyworld.textColor = UIColor.whiteColor()
                label_keyworld.backgroundColor = UIColor.purpleColor()
                
                let label_keyworld_name = UILabel(frame: CGRectMake(self.view.frame.width*7/10,self.view.frame.height*0.6842,self.view.frame.width*3/10,self.view.frame.height*0.0395))
                label_keyworld_name.text = SQL_relevance as String
                label_keyworld_name.layer.borderColor = UIColor.whiteColor().CGColor
                label_keyworld_name.layer.borderWidth = 2
                label_keyworld_name.textAlignment = NSTextAlignment.Center
                label_keyworld_name.textColor = UIColor.yellowColor()
                label_keyworld_name.backgroundColor = UIColor.purpleColor()
                
                let text = UITextView()
                text.frame = CGRectMake(0,self.view.frame.height*0.7237,self.view.frame.width,self.view.frame.height*0.2763)
                text.text = {
                    if SQL_intro_niweishiyi == ""
                    {return SQL_intro_zhengweishiyi as String}
                    return SQL_intro_niweishiyi as String
                }()//数据转换
                text.alpha = 0.7
                text.font = UIFont(name: "System", size: 100)
                text.editable = false
                text.selectable = false //防止复制
                
                self.view.addSubview(image)
                self.view.addSubview(label_star)
                self.view.addSubview(label_star_name)
                self.view.addSubview(label_keyworld)
                self.view.addSubview(label_keyworld_name)
                self.view.addSubview(text)
                break
            }
            num++
        }
    }
    

    func loadDetail(ctrl:String)
    {
        kapai_jianshan_SQL(self.title!)
        
        let label_dati = UILabel(frame: CGRectMake(0, 80, self.view.bounds.width, 40))
        label_dati.text = "大体"
        label_dati.textColor = UIColor.whiteColor()
        label_dati.backgroundColor = UIColor.purpleColor()
        label_dati.textAlignment = NSTextAlignment.Center
        
        let text_dati = UITextView(frame: CGRectMake(0, 120, self.view.bounds.width, 100))
        text_dati.text = SQL_intro_dati as String
        text_dati.editable = false
        text_dati.selectable = false //防止复制
        
        let label_sex = UILabel(frame: CGRectMake(0, 220, self.view.bounds.width, 40))
        label_sex.text = "两性"
        label_sex.textColor = UIColor.whiteColor()
        label_sex.backgroundColor = UIColor.purpleColor()
        label_sex.textAlignment = NSTextAlignment.Center
        
        let text_sex = UITextView(frame: CGRectMake(0, 260, self.view.bounds.width, 100))
        text_sex.text = SQL_intro_sex as String
        text_sex.editable = false
        text_sex.selectable = false //防止复制
        
        let label_story = UILabel(frame: CGRectMake(0, 360, self.view.bounds.width, 40))
        label_story.text = "故事"
        label_story.textColor = UIColor.whiteColor()
        label_story.backgroundColor = UIColor.purpleColor()
        label_story.textAlignment = NSTextAlignment.Center
        
        let text_story = UITextView(frame: CGRectMake(0, 400, self.view.bounds.width, self.view.bounds.height-400))
        text_story.text = SQL_intro_story as String
        text_story.editable = false
        text_story.selectable = false //防止复制
        
        self.view.addSubview(label_dati)
        self.view.addSubview(text_dati)
        self.view.addSubview(label_sex)
        self.view.addSubview(text_sex)
        self.view.addSubview(label_story)
        self.view.addSubview(text_story)
    }
    
    func btnClicked(sender:AnyObject){
        clearViews()
        if self.navigationItem.rightBarButtonItem!.title == "详细"{
            self.navigationItem.rightBarButtonItem!.title="简介"
            self.view.backgroundColor = UIColor.purpleColor()
            loadDetail(self.title!)
        }
        else{
            self.navigationItem.rightBarButtonItem!.title = "详细"
            loadIntroduce(self.title!)
        }
    }
    
    func clearViews(){
        for v in self.view.subviews {
            v.removeFromSuperview()
        }
    }
}
