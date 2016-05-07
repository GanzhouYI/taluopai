//
//  yindao.swift
//  塔罗牌
//
//  Created by __________V|R__________ on 15/12/7.
//  Copyright © 2015年 123. All rights reserved.
//

import UIKit
class yindao:UIViewController,UIScrollViewDelegate{
    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    var btn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        let SQL_Card = SQLite_pai()
        SQL_Card.createOrOpenDatabase()
        SQL_Card.createTable()
        SQL_Card.insertCard()
        //SQL_Card.queryCard()
        //SQL_Card.deleteCard()
        SQL_Card.queryCard()
        pageControl.center = CGPointMake(self.view.frame.width/2, self.view.frame.height*0.95)
        pageControl.currentPageIndicatorTintColor = UIColor.purpleColor()
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.numberOfPages = 4
        pageControl.addTarget(self, action: Selector("scrollViewDidEndDecelerating"), forControlEvents: UIControlEvents.ValueChanged)
        
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSizeMake(4*self.view.frame.width,0)
        scrollView.pagingEnabled = true
        scrollView.bounces = false//弹簧效果
        scrollView.showsHorizontalScrollIndicator = false//水平导航条
        scrollView.delegate = self
        self.view.addSubview(scrollView)

        for i in 0...3
        {
            let image = UIImage(named: "yindao\(i+1).jpg")
            let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            imageView.image = image
            var frame = imageView.frame
            frame.origin.x = CGFloat(i)*frame.size.width
            imageView.frame = frame
            scrollView.addSubview(imageView)
            self.view.addSubview(pageControl)
        }
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/self.view.frame.size.width)
        pageControl.currentPage = index
        if index == 3
        {
            self.btn.frame = CGRectMake(3*self.view.frame.width, self.view.frame.height, self.view.frame.width, 50)
            self.btn.setTitle("进入塔罗牌", forState: UIControlState.Normal)
            self.btn.titleLabel?.font = UIFont.systemFontOfSize(20)
            self.btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
            self.btn.backgroundColor = UIColor.purpleColor()
            self.btn.alpha = 0//透明度
            self.btn.addTarget(self, action: "buttonClick", forControlEvents: UIControlEvents.TouchUpInside)
            UIView.animateWithDuration(1.5, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: {()-> Void in
                self.btn.frame = CGRectMake(3*self.view.frame.width,self.view.frame.height-100,self.view.frame.width,50)//按钮从下面100往上移的动画
                self.btn.alpha = 1
                self.scrollView.addSubview(self.btn)//按钮加到scrollview上
                }, completion: nil)
        }
    }
    
    func buttonClick()
    {
        let zhujiemian=ViewController()
        self.presentViewController(zhujiemian, animated: true, completion: nil)
    }
    
    //UIViewAnimationOptions 出来的方式
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}