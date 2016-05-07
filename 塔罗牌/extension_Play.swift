//
//  extern_Play.swift
//  塔罗牌
//
//  Created by __________V|R__________ on 15/12/9.
//  Copyright © 2015年 123. All rights reserved.
//

import UIKit

extension Play
{
    func tapped_1(button:UIButton)
    {
        if self.num<4
        {
            self.button_num.append(button)
            self.button_name.append(button.titleLabel!.text!)
            
            UIView.animateWithDuration(1, // 动画时长
                delay:0 ,// 动画延迟z
                usingSpringWithDamping:1.0 ,// 类似弹簧振动效果 0~1
                initialSpringVelocity:1.0 ,// 初始速度
                options:UIViewAnimationOptions.CurveEaseIn, // 动画过渡效果
                animations: {()-> Void in
                    systemSound("抽四张牌")
                    button.frame.origin=paiweizhi[self.num++]
                    button.frame.size.width=self.view.bounds.width*(0.6/2.6)
                    button.frame.size.height=self.view.bounds.height*(1.2/3.8)
                    button.layer.shadowOpacity = 0.8
                }, completion: nil)
            
            button.layer.shadowColor = UIColor.grayColor().CGColor
            button.layer.shadowOffset = CGSize(width: 1, height: 1)
            
            button.enabled=false//禁用按钮
            button.adjustsImageWhenDisabled=false//禁用按钮图标不会变暗
            button.addTarget(self, action: Selector("tapped_2:"), forControlEvents: UIControlEvents.TouchUpInside)
            
            if self.num==4//最后一个按钮也完成了
            {
                
                self.view.addSubview(menu_button)
                for i in 0...3
                {
                    self.button_num[i].enabled=true
                }
            }
        }
    }
    
    func tapped_2(button:UIButton)
    {
        button.removeTarget(self, action: Selector("tapped_1:"), forControlEvents: UIControlEvents.TouchUpInside)
        systemSound("翻牌")
        
        button.setBackgroundImage(kazu.image[Int(button.titleLabel!.text!)!], forState: UIControlState.Normal)
        button.addTarget(self, action: Selector("tapped_3:"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func tapped_3(button:UIButton)
    {
        systemSound("展示一张")
        button.removeTarget(self, action: Selector("tapped_2:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.origin_x=button.frame.origin.x
        self.origin_y=button.frame.origin.y
        button.frame.origin.x=self.view.bounds.width*(0.7/2.6)
        button.frame.origin.y=self.view.bounds.height*(0.2/3.8)
        button.frame.size.width=self.view.bounds.width*(0.6/2.6)*2
        button.frame.size.height=self.view.bounds.height*(1.2/3.8)*2
        button.layer.shadowOpacity = 0.8
        button.addTarget(self, action: Selector("tapped_4:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.white_button = UIButton(frame: CGRectMake(0,0,self.view.bounds.width,self.view.bounds.height))
        self.white_button.backgroundColor = UIColor.whiteColor()
        self.white_button.alpha = 0.5
        
        kapai_data_SQL(button.titleLabel!.text!)//数据转换之前的函数
        
       self.kapai_data_title.frame = CGRectMake(0,self.view.frame.height*0.682,self.view.frame.width,self.view.frame.height*0.05)
        self.kapai_data_title.text = SQL_card_name as String//数据转换
        self.kapai_data_title.textColor = UIColor.whiteColor()
        self.kapai_data_title.font = UIFont(name: "System", size: 40)
        self.kapai_data_title.textAlignment = NSTextAlignment.Center
        self.kapai_data_title.backgroundColor = UIColor.purpleColor()
        
       self.kapai_data_text.frame = CGRectMake(0,self.view.frame.height*0.732,self.view.frame.width,self.view.frame.height*0.268)
        self.kapai_data_text.text = {
            if SQL_intro_niweishiyi == ""
            {return SQL_intro_zhengweishiyi as String}
            return SQL_intro_niweishiyi as String
            }()//数据转换
        self.kapai_data_text.font = UIFont(name: "System", size: 100)
        self.kapai_data_text.editable = false
        self.kapai_data_text.selectable = false //防止复制
        
        num_dingwei = Int(button.titleLabel!.text!)!//数据转换
        
        self.view.addSubview(white_button)
        self.view.addSubview(button)
        self.view.addSubview(kapai_data_title)
        self.view.addSubview(kapai_data_text)
        for i in 0...3
        {
            if button_num[i].titleLabel!.text!   !=   button.titleLabel!.text!
            {
                button_num[i].enabled=false//加锁,其他的按钮都不能按
            }
        }
    }
    
    func tapped_4(button:UIButton)
    {
        button.removeTarget(self, action: Selector("tapped_3:"), forControlEvents: UIControlEvents.TouchUpInside)
        button.frame.origin.x=origin_x
        button.frame.origin.y=origin_y
        button.frame.size.width=self.view.bounds.width*(0.6/2.6)
        button.frame.size.height=self.view.bounds.height*(1.2/3.8)
        button.layer.shadowOpacity = 0.8
        systemSound("展示完回去")
        self.kapai_data_share.text = "今天运势不错哦，抽到了"+"\(button_name[0])、"+"\(button_name[1])、"+"\(button_name[2])、"+"\(button_name[3])。"
        self.kapai_data_title.removeFromSuperview()
        self.kapai_data_text.removeFromSuperview()
        self.white_button.removeFromSuperview()
        button.removeTarget(self, action: Selector("tapped_4:"), forControlEvents: UIControlEvents.TouchUpInside)
        button.addTarget(self, action: Selector("tapped_3:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        for i in 0...3
        {
            self.button_num[i].enabled=true//解锁
        }
        self.menu_button.setTitle("浏览完点我", forState: UIControlState.Normal)
        self.menu_button.setTitleColor(UIColor.purpleColor(), forState: UIControlState.Normal)
        self.menu_button.enabled=true
    }
    
    
    func menu_play()//把seg都添加进来
    {
        systemSound("点击中间")
        for i in 0...kazu.num_pai-1
        {
        kazu.pai[i].setBackgroundImage(kazu.image[i], forState: UIControlState.Normal)
        }
        self.seg.selectedSegmentIndex=1
        self.view.addSubview(white_button)
        self.view.addSubview(kapai_data_share)
        self.view.addSubview(btSend)
        self.view.addSubview(seg)
        self.view.addSubview(pickerView)
        self.view.addSubview(share_title)
        self.view.addSubview(btSend)

    }

    
    func send()
    {
        //分享
        let newsUrl = NSURL(string: "http://www.baidu.com")
        let title = "塔罗牌"
        let description = self.kapai_data_share.text
        let previewImageUrl = NSURL(string: "http://www.hangge.com/blog/images/logo.png")
        let newsObj = QQApiNewsObject(URL: newsUrl, title: title, description: description,
                                      previewImageURL: previewImageUrl, targetContentType: QQApiURLTargetTypeNews)
        let req = SendMessageToQQReq(content: newsObj)
        QQApiInterface.sendReq(req)
        
        //发送并获取响应结果
        let sendResult = QQApiInterface.sendReq(req)
        //处理结果
        handleSendResult(sendResult)
    }
    //处理分享返回结果
    func handleSendResult(sendResult:QQApiSendResultCode){
        var message = ""
        
        switch(sendResult){
        case EQQAPIAPPNOTREGISTED:
            message = "App未注册"
            self.alertTip = UIAlertController(title: "App未注册", message: "error", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "好的", style: .Default,handler: nil)
            alertTip.addAction(okAction)
            self.presentViewController(alertTip, animated: true, completion: nil)
        case EQQAPIMESSAGECONTENTINVALID, EQQAPIMESSAGECONTENTNULL,
             EQQAPIMESSAGETYPEINVALID:
            message = "发送参数错误"
            self.alertTip = UIAlertController(title: "发送参数错误", message: "error", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "好的", style: .Default,handler: nil)
            alertTip.addAction(okAction)
            self.presentViewController(alertTip, animated: true, completion: nil)
        case EQQAPIQQNOTINSTALLED:
            message = "QQ未安装"
            self.alertTip = UIAlertController(title: "QQ未安装", message: "error", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "好的", style: .Default,handler: nil)
            alertTip.addAction(okAction)
            self.presentViewController(alertTip, animated: true, completion: nil)
        case EQQAPIQQNOTSUPPORTAPI:
            message = "API接口不支持"
            self.alertTip = UIAlertController(title: "API接口不支持", message: "error", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "好的", style: .Default,handler: nil)
            alertTip.addAction(okAction)
            self.presentViewController(alertTip, animated: true, completion: nil)
        case EQQAPISENDFAILD:
            message = "发送失败"
            self.alertTip = UIAlertController(title: "发送失败", message: "error", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "好的", style: .Default,handler: nil)
            alertTip.addAction(okAction)
            self.presentViewController(alertTip, animated: true, completion: nil)
        case EQQAPIQZONENOTSUPPORTTEXT:
            message = "空间分享不支持纯文本分享，请使用图文分享"
            self.alertTip = UIAlertController(title: "发送失败", message: "空间分享不支持纯文本分享，请使用图文分享", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "好的", style: .Default,handler: nil)
            alertTip.addAction(okAction)
            self.presentViewController(alertTip, animated: true, completion: nil)
        case EQQAPIQZONENOTSUPPORTIMAGE:
            message = "空间分享不支持纯图片分享，请使用图文分享"
            self.alertTip = UIAlertController(title: "发送失败", message: "空间分享不支持纯图片分享，请使用图文分享", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "好的", style: .Default,handler: nil)
            alertTip.addAction(okAction)
            self.presentViewController(alertTip, animated: true, completion: nil)
        default:
            message = "发送成功"
            self.alertTip = UIAlertController(title: "发送失败", message: "空间分享不支持纯图片分享，请使用图文分享", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "好的", style: .Default,handler: nil)
            alertTip.addAction(okAction)
            self.presentViewController(alertTip, animated: true, completion: nil)
        }
        print(message)
    }
    
    //MARK：分段索引变化
    func segmentChanged(sender:UISegmentedControl)//
    {
        switch self.seg.selectedSegmentIndex
        {
        case 0:
            systemSound("中间返回")
            self.white_button.removeFromSuperview()
            self.btSend.removeFromSuperview()
            self.seg.removeFromSuperview()
            self.pickerView.removeFromSuperview()
            self.share_title.removeFromSuperview()
            self.kapai_data_share.removeFromSuperview()
            break//提醒视图
            //返回
            
        case 1: //break//操作表示视图UIAlertController
            //分享
            self.pickerView.frame=CGRectMake(0,self.view.frame.height/3,self.view.frame.width,self.view.frame.height*4/15.7)
            self.view.addSubview(self.pickerView)
            

            
            self.pickerView.backgroundColor=UIColor.whiteColor()
            self.pickerView.dataSource=self
            self.pickerView.delegate=self
            self.pickerView.showsSelectionIndicator=true//ios7以后的版本选择false和true没有区别
            //设置选择器显示的默认值
            self.pickerView.selectRow(1, inComponent: 0, animated: true)
            self.view.bringSubviewToFront(self.pickerView)
            //self.view.addSubview(self.pickerView)
            break
        case 2:
            //返回主界面
            self.presentViewController(GameUpload(), animated: true, completion: nil)
            break
        default:
            break
        }
    }
    

  
    //解决textField遮挡键盘,开始
    func textFieldDidBeginEditing(textField: UITextField) {
        let offset:CGFloat =  20
        
        self.view.frame = CGRectMake(0.0, -offset, self.view.frame.size.width, self.view.frame.size.height)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //解决textField遮挡键盘,结束
    func textFieldDidEndEditing(textField: UITextField) {
        //
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        
    }
    
    
    //MARK:设置选择器的各项内容，继承于UIPickerViewDelegate协议
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sportArray[row]
    }
    
    //MARK:设置选择器的列数，属于UIPickerViewDatasource协议
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //MARK:设置选择器的行数，属于UIPickerViewDatasource协议
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sportArray.count
    }
    
    
    //MARK检测行的选择状态
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    

    
}