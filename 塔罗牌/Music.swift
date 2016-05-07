//
//  Music.swift
//  塔罗牌
//
//  Created by __________V|R__________ on 15/12/14.
//  Copyright © 2015年 123. All rights reserved.
//

import Foundation
import AudioToolbox

func systemSound(music:String) {
    //建立的SystemSoundID对象
    var soundID:SystemSoundID = 0
    //获取声音地址
    let path = NSBundle.mainBundle().pathForResource(music, ofType: "wav")
    //print(NSBundle.mainBundle())
    //地址转换
    let baseURL = NSURL(fileURLWithPath: path!)
    //赋值
    AudioServicesCreateSystemSoundID(baseURL, &soundID)
    //播放声音
    AudioServicesPlaySystemSound(soundID)
}

