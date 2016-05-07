//
//  search_SQL.swift
//  塔罗牌
//
//  Created by __________V|R__________ on 15/12/9.
//  Copyright © 2015年 123. All rights reserved.
//

import Foundation

var kapai_data_text_String = ""
var kapai_data_title_String = ""

var kapai_data_share_String = ""

var num_dingwei = Int()

var SQL_num_ID = num_dingwei

func kapai_data_SQL(button_title:String)
{
    let SQL_Card = SQLite_pai()
    
    SQL_card_name=""
    SQL_star_name=""
    SQL_relevance=""
    SQL_intro_story=""
    SQL_intro_jiedu=""
    SQL_intro_zhengweishiyi=""
    SQL_intro_niweishiyi=""
    SQL_intro_dati=""
    SQL_intro_sex=""
    SQL_intro_daoli=""
    
    SQL_Card.createOrOpenDatabase()
    var ID:Int
    var n:Int
    var zhengni:Int//0是正，1是反。偶数是正，奇数是反
    n = kazu.value[Int(button_title)!]
    if (n) == 0
    {
        ID=0
        zhengni=0
    }
    else if (n)%2 != 0//奇数
    {
        ID=(n+1)/2-1
        zhengni=1
    }
    else//偶数
    {
        ID=(n)/2
        zhengni=0
    }
    ID=ID+1
    SQL_Card.queryCard_jiedu(ID,zhengni: zhengni)
}


func kapai_jianshan_SQL(title:String)
{
    SQL_card_name=""
    SQL_star_name=""
    SQL_relevance=""
    SQL_intro_story=""
    SQL_intro_jiedu=""
    SQL_intro_zhengweishiyi=""
    SQL_intro_niweishiyi=""
    SQL_intro_dati=""
    SQL_intro_sex=""
    SQL_intro_daoli=""
    
    let SQL_Card = SQLite_pai()
    SQL_Card.createOrOpenDatabase()
    var ID:Int=0
    var n:Int=0
    var zhengni:Int!
    for i in kapai_names
    {
        if i == title
        {
            if n==0
            {
                ID = 0
                zhengni=0
                break
            }
            else if n%2 != 0//奇数
            {
                ID = (n-1)/2
                zhengni=1
                break
            }
            else if n%2 == 0//偶数
            {
                ID = n/2
                zhengni=0
                break
            }
        }
        n++
    }
    ID = ID+1
    SQL_Card.queryCard_jiedu(ID,zhengni: zhengni)
}





