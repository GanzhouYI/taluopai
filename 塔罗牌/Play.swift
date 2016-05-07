//
//  Play.swift
//  塔罗牌
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 123. All rights reserved.
//
//  pai[i]  即value[i]  即 image[i]   即pai.title.text  只是 image[i]=随机数
import UIKit

class Play: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate ,UIScrollViewDelegate,UITextFieldDelegate{
    
    var _tencentOAuth:TencentOAuth!//分享腾讯空间
    var alertTip=UIAlertController()
    var kapai_data_share = UITextView()//分享今天的幸运
    var btSend = UIButton()//发送按钮
    var seg:UISegmentedControl!//分段控件
    var pickerView=UIPickerView()//普通的选择器
    var sportArray=["QQ空间","新浪微博","微信朋友圈","Istream","Facebook"]
    let items = ["返回","分享","主界面"]
    var share_title = UILabel()
    var show_22 = UIButton()
//================================================================
    var button_num:[UIButton]=[]
    var button_name:[String]=[]
    var kapai_data = [String]()//四张牌的信息
    var num:Int=0//选中的牌数
    var origin_x=CGFloat()
    var origin_y=CGFloat()
    var white_button = UIButton()//模糊图层
    var menu_button = UIButton()//返回按钮
    var kacao_4_1 = UIImageView()//四个卡背
    var kacao_4_2 = UIImageView()
    var kacao_4_3 = UIImageView()
    var kacao_4_4 = UIImageView()
    let imageView = UIImageView()//背景
    var kapai_data_text = UITextView()//卡片信息
    var kapai_data_title = UILabel()//卡牌名字
//================================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _tencentOAuth = TencentOAuth.init(appId: "1105308401", andDelegate: nil)
        self.show_22.frame=self.view.frame
        self.show_22.setBackgroundImage(UIImage(named: "show_one_BG.jpg"), forState: UIControlState.Normal)
        self.show_22.alpha = 0.9
        self.show_22.addTarget(self, action: Selector("Show_22"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.imageView.frame=self.view.frame
        self.imageView.image=UIImage(named: "BG_ALL.jpg")
        self.imageView.contentMode=UIViewContentMode.ScaleAspectFill
        
        self.kacao_4_1.frame = CGRectMake(self.view.frame.width*(0.05), self.view.frame.height*(0.28), self.view.frame.width*(0.27), self.view.frame.height*(0.34))
        //self.kacao_4.frame = self.view.frame
        self.kacao_4_1.image = UIImage(named: "kacao_4")
        self.kacao_4_1.contentMode = UIViewContentMode.ScaleToFill
        
        self.kacao_4_2.frame = CGRectMake(self.view.frame.width*(0.3577), self.view.frame.height*(0.4642), self.view.frame.width*(0.27), self.view.frame.height*(0.34))
        //self.kacao_4.frame = self.view.frame
        self.kacao_4_2.image = UIImage(named: "kacao_4")
        self.kacao_4_2.contentMode = UIViewContentMode.ScaleToFill
        
        self.kacao_4_3.frame = CGRectMake(self.view.frame.width*(0.6654), self.view.frame.height*(0.28), self.view.frame.width*(0.27), self.view.frame.height*(0.34))
        //self.kacao_4.frame = self.view.frame
        self.kacao_4_3.image = UIImage(named: "kacao_4")
        self.kacao_4_3.contentMode = UIViewContentMode.ScaleToFill
        
        self.kacao_4_4.frame = CGRectMake(self.view.frame.width*(0.3577), self.view.frame.height*(0.0431), self.view.frame.width*(0.27), self.view.frame.height*(0.34))
        //self.kacao_4.frame = self.view.frame
        self.kacao_4_4.image = UIImage(named: "kacao_4")
        self.kacao_4_4.contentMode = UIViewContentMode.ScaleToFill
        
        self.view.addSubview(imageView)
        self.view.addSubview(kacao_4_1)
        self.view.addSubview(kacao_4_2)
        self.view.addSubview(kacao_4_3)
        self.view.addSubview(kacao_4_4)
//================================================================
//   seg里的布局
        self.seg = UISegmentedControl(items: items)
        self.seg.frame=CGRectMake(0, self.view.frame.height*14.5/15.7, self.view.frame.width, self.view.frame.height*(1.2/15.7))
        self.seg.tintColor=UIColor.purpleColor()
        self.seg.selectedSegmentIndex=1//默认选择分享
        self.seg.addTarget(self, action: Selector("segmentChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        
        self.share_title.text = "塔罗牌"
        self.share_title.frame = CGRectMake(0, 20, self.view.frame.width, self.view.frame.height/15)
        self.share_title.textColor = UIColor.whiteColor()
        self.share_title.backgroundColor = UIColor.purpleColor()
        self.share_title.font = UIFont(name: "System", size: 40)
        self.share_title.textAlignment = NSTextAlignment.Center
        
        self.kapai_data_share.frame = CGRectMake(0, self.view.frame.height/15+20, self.view.frame.width, self.view.frame.height/3)
        
        self.pickerView.frame=CGRectMake(0,self.view.frame.height/3,self.view.frame.width,self.view.frame.height*4/15.7)
        self.pickerView.backgroundColor=UIColor.whiteColor()
        self.pickerView.dataSource=self
        self.pickerView.delegate=self
        self.pickerView.showsSelectionIndicator=true//ios7以后的版本选择false和true没有区别
        //设置选择器显示的默认值
        self.pickerView.selectRow(1, inComponent: 0, animated: true)
        
        self.btSend.frame = CGRectMake(self.view.frame.width-50, 20, 50, self.view.frame.height/15)
        self.btSend.setTitle("发送", forState: UIControlState.Normal)
        self.btSend.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.btSend.backgroundColor = UIColor.purpleColor()
        self.btSend.addTarget(self, action: Selector("send"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.menu_button.frame = CGRectMake(self.view.frame.width/2.6, self.view.frame.height*(1.4/3.8), self.view.frame.width*0.6/2.6, self.view.frame.height*(0.4/3.8))
//      seg里的布局
//=============================================================
        
        self.menu_button.setBackgroundImage(UIImage(named: "menu_button_play"), forState: UIControlState.Normal)
        self.menu_button.addTarget(self, action: Selector("menu_play"), forControlEvents: UIControlEvents.TouchUpInside)
        self.menu_button.adjustsImageWhenDisabled=false//禁用按钮图标不会变暗
        self.menu_button.enabled=false
        
        kazu.pai[0].setBackgroundImage(UIImage(named: "卡背.jpg"), forState: UIControlState.Normal)
        kazu.pai[0].alpha = 0//透明度
        self.view.addSubview(kazu.pai[0])
        self.view.addSubview(show_22)
        
    }
    
    
    func Show_22()
    {
        self.show_22.removeFromSuperview()
        for i in 0...kazu.num_pai-1
        {
            kazu.pai[i].setBackgroundImage(UIImage(named: "卡背.jpg"), forState: UIControlState.Normal)
            kazu.pai[i].alpha = 0//透明度
            kazu.pai[i].addTarget(self, action: Selector("tapped_1:"), forControlEvents: UIControlEvents.TouchUpInside)
            UIView.animateWithDuration(1, // 动画时长
                delay:0.5 ,// 动画延迟z
                usingSpringWithDamping:1.0 ,// 类似弹簧振动效果 0~1
                initialSpringVelocity:0 ,// 初始速度
                options:UIViewAnimationOptions.CurveEaseInOut, // 动画过渡效果
                animations: {()-> Void in
                    kazu.pai[i].frame =  kazu.pai[i].frame//按钮从第一张牌往右移
                    kazu.pai[i].alpha = 1//两个透明度
                    self.view.addSubview(kazu.pai[i])
                }, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
