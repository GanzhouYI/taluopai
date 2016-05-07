//
//  ViewController.swift
//  塔罗牌
//
//  Created by 123 on 15/11/13.
//  Copyright © 2015年 123. All rights reserved.
//

import UIKit

class kapaijianshan: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    var allnames:[String]!
    
    var table:UITableView!
    private let identify = "aCell"
    
    var searchBar = UISearchBar()
    var ctrlsel:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "卡牌鉴赏"
        self.view.backgroundColor = UIColor.purpleColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.backgroundColor = UIColor.purpleColor()
        
        let btn = UIBarButtonItem(title: "返回主界面", style: UIBarButtonItemStyle.Plain, target: self, action: "return_menu")
        self.navigationItem.leftBarButtonItem = btn
        
        self.allnames = kapai_names
        
        //1.初始化表
        self.table = UITableView(frame: self.view.frame, style: UITableViewStyle.Grouped)
        //2.设置数据源和委托，同时对加载该表的类，继承协议
        self.table.dataSource=self
        self.table.delegate=self
        //3.创建、注册一个可重用的单元格
        self.table.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: identify)
        
        //5.添加搜索条
        self.ctrlsel = self.allnames //初始搜索结果
        self.searchBar.sizeToFit()
        searchBar.delegate=self
        self.table.tableHeaderView=self.searchBar
        
        self.view.addSubview(self.table)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK:UITableViewDataSource协议中的方法
    //可选实现方法，返回分区数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //1.返回每个分区的行数，默认分区是1，必须实现
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlsel.count
    }
    
    //2.配置单元格，并返回，必须实现
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var data = self.ctrlsel  //字典根据键取值
        
        let cell = table.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator  //单元格按钮风格
        //temp_image=UIImage(named:imagePath[suiji_num[i]])!
        let img = UIImage(named: "\(imagePath[indexPath.row])")
        cell.imageView!.image = img
        cell.textLabel?.text=data[indexPath.row]
        return cell
    }
    
    
    //4.返回制定分区的尾部
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        //return "有\(self.allnames[section]!.count)个控件"
        return "总共有\(self.ctrlsel.count)张牌"
    }
    
    
    
    //MARK:UITableViewDelegate协议中的方法,主要负责单元格行为的处理
    //1.处理表的选中事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消选中状态
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let itemStr = self.ctrlsel[indexPath.row]
        systemSound("按键")
        let detail = kapaijianshan_detail()
        detail.title = itemStr
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    //MARK: 搜索代理UISearchBarDelegate方法，每次改变搜索内容时都会调用
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String)
    {
        
        if searchText == ""
        {    // 没有搜索内容时显示全部组件
            self.ctrlsel = self.allnames
        }
        else
        {                    // 匹配用户输入内容的前缀
            self.ctrlsel = []
            for ct in self.allnames
            {
                if (ct.rangeOfString(searchText) != nil)
                {
                    ctrlsel.append(ct)
                }
            }
        }
        
        self.table.reloadData()// 刷新Table View显示
    }
    
    func return_menu()
    {
//        for v in self.view.subviews {        可能需要清楚子视图
//            v.removeFromSuperview()
//        }
        self.presentViewController(GameUpload(), animated: true, completion: nil)
    }
    
    // 搜索代理UISearchBarDelegate方法，点击虚拟键盘上的Search按钮时触发
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
}

