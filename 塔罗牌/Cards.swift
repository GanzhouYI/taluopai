//
//  Cards.swift
//  塔罗牌
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 123. All rights reserved.
//

import UIKit
var screenBounds:CGRect = UIScreen.mainScreen().bounds//屏幕大小
var num_pai=22

let documentsPath:String = {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    return paths.first!
}()//文件Document目录（存放用户产生的路径）

let BundlePath = NSBundle.mainBundle().bundlePath//存放应用可执行文件相关资源文件，可读可执行不能修改
let mainBundlePath = NSBundle.mainBundle()

var kapai_names = [ "0愚人前","0愚人后","1魔术师前","1魔术师后","2女祭祀前","2女祭祀后","3女皇前","3女皇后","4皇帝前","4皇帝后","5教皇前","5教皇后","6恋人前","6恋人后","7战车前","7战车后","8力量前","8力量后","9隐士前","9隐士后","10命运之轮前","10命运之轮后","11正义前","11正义后","12倒吊人前","12倒吊人后","13死神前","13死神后","14节制前","14节制后","15魔鬼前","15魔鬼后","16高塔前","16高塔后","17星星前","17星星后","18月亮前","18月亮后","19太阳前","19太阳后","20审判前","20审判后","21世界前","21世界后"]

let imagePath:[String]={
    var path:[String]=[]
    var temp=""
    for i in 0...43
    {
        temp=kapai_names[i]+".png"
        path.append(temp)
        print(temp)
    }
/*var bundleRootFilePath = mainBundlePath.pathForResource("", ofType: "png")//获得字符串的文件路径，还有一种获得NSURL类型文件路径

    bundleRootFilePath = mainBundlePath.pathForResource("0愚人前", ofType: "png")
        path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("0愚人后", ofType: "png")
        path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("1魔术师前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("1魔术师后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("2女祭祀前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("2女祭祀后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("3女皇前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("3女皇后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("4皇帝前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("4皇帝后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("5教皇前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("5教皇后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("6恋人前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("6恋人后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("7战车前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("7战车后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("8力量前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("8力量后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("9隐士前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("9隐士后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("10命运之轮前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("10命运之轮后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("11正义前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("11正义后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("12倒吊人前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("12倒吊人后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("13死神前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("13死神后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("14节制前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("14节制后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("15魔鬼前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("15魔鬼后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("16高塔前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("16高塔后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("17星星前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("17星星后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("18月亮前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("18月亮后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("19太阳前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("19太阳后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("20审判前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("20审判后", ofType: "png")
    path.append(bundleRootFilePath!)
    
    bundleRootFilePath = mainBundlePath.pathForResource("21世界前", ofType: "png")
    path.append(bundleRootFilePath!)
    bundleRootFilePath = mainBundlePath.pathForResource("21世界后", ofType: "png")
    path.append(bundleRootFilePath!)
    */
    return path
}()

struct Card
{
    var num_pai:Int
    var value:[Int]
    var image:[UIImage]
    var pai:[UIButton]
}

var path="\(BundlePath)"
var suiji_num=[Int]()

var paiweizhi:[CGPoint]={//选出来的4张牌放的位置
    var temp:[CGPoint]=[]
    var temp1:CGPoint
    
    temp1=CGPointMake(screenBounds.width*(0.3846), screenBounds.height*(0.4737))
    temp.append(temp1)
    
    temp1=CGPointMake(screenBounds.width*(0.0769), screenBounds.height*(0.2895))
    temp.append(temp1)
    
    temp1=CGPointMake(screenBounds.width*(0.6923), screenBounds.height*(0.2895))
    temp.append(temp1)
    
    temp1=CGPointMake(screenBounds.width*(0.3846), screenBounds.height*(0.0526))
    temp.append(temp1)
    
    return temp
}()


func suijinum()
{
    var suiji_temp=[Int]()//有几个随机数，如果value不是0...4则需要改
    var suijiNum:Int=0
    suiji_num.removeAll(keepCapacity:false)
    for i in 0...num_pai-1
    {
        suiji_temp.append(i)
    }
    for _ in 0...num_pai-1
    {
        suijiNum=Int(arc4random_uniform(UInt32(suiji_temp.count)))
        suiji_num.append(suiji_temp[suijiNum])
        suiji_temp.removeAtIndex(suijiNum)
    }
}

var value_kazu:[Int]=[]

var image_kazu:[UIImage]=[]

var pai_kazu:[UIButton]=[]

func init_suiji_value_kazu()
{
        var temp_value=Int()
        var temp_values=[Int]()
        for i in 0...num_pai-1
        {
            temp_value=suiji_num[i]
            temp_values.append(temp_value)
        }
        value_kazu = temp_values
}

func init_suiji_image_kazu()
{
        var temp_image=UIImage()
        var temp_images=[UIImage]()
        for i in 0...num_pai-1
        {
            temp_image=UIImage(named:imagePath[suiji_num[i]])!
            temp_images.append(temp_image)
        }
        image_kazu = temp_images
}

func init_suiji_pai_kazu()
{
        var temps:[UIButton]=[]
        var temp:UIButton
        
        var temp_x_y:CGPoint=CGPoint()
        var begin_x:CGFloat=(0.2/2.6)*screenBounds.width
        let begin_y:CGFloat=(3/3.8)*screenBounds.height
        var _x_y=[CGPoint]()
        
        let everyOneAdd_x:CGFloat=(1.7/2.6)/21*screenBounds.width

        for _ in 0...num_pai-1//生成坐标
        {
            temp_x_y.x=begin_x
            temp_x_y.y=begin_y
            _x_y.append(temp_x_y)
            begin_x += everyOneAdd_x
        }
        
        for i in 0...num_pai-1
        {
            temp=UIButton(frame:CGRectMake(_x_y[i].x,_x_y[i].y, screenBounds.width/6, screenBounds.height*7/32))
            temp.setTitle("\(i)", forState:UIControlState.Normal) //普通状态下的文字
            temp.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            temp.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
            temp.contentVerticalAlignment = UIControlContentVerticalAlignment.Top
            temps.append(temp)
        }
        pai_kazu = temps
}

func init_suiji()//除了牌数22张其余全改
{
    suiji_num.removeAll()
    value_kazu.removeAll()
    image_kazu.removeAll()
    pai_kazu.removeAll()
    
    suijinum()//先生成随机数
    init_suiji_value_kazu()
    init_suiji_pai_kazu()
    init_suiji_image_kazu()
    
    kazu.value = value_kazu
    kazu.image = image_kazu
    kazu.pai = pai_kazu
}


var kazu=Card(num_pai:num_pai,value: value_kazu,image: image_kazu,pai: pai_kazu)


class Cards: UIView {
    
    
}
