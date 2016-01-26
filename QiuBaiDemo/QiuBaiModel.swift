//
//  QiuBaiModel.swift
//  QiuBaiDemo
//
//  Created by wanghui on 16/1/25.
//  Copyright © 2016年 王辉. All rights reserved.
//

import UIKit

class QiuBaiModel: NSObject {
    var  Icon : String!//用户头像
    var userName: String!//用户昵称
    var userContact :String!//用户发表的内容
    
    
    //定义一个构造方法
    init (dic: NSDictionary) {
        //给 contact赋值
        self.userContact = dic.objectForKey("content") as!String
        //is相当于OC中isKindOf  做判断
        if dic["user"]is NSDictionary {
           //给用户昵称赋值
        let user = dic.objectForKey("user") as! NSDictionary
        self.userName = user.objectForKey("login") as! String
        //给用户头像赋值
        //图片拼接:网络地址的前缀/用户ID前四位/用户ID/medium/图片名
        //图片前缀
        let prefixStr = "http://pic.qiushibaike.com/system/avtnew"
        //获取用户ID
        let userId = user.objectForKey("id")as!Int
        //用户id转成字符串
        let userIdStr = String(userId)
        let num: Int = userIdStr.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
        let prefixId = userIdStr.substringToIndex(userIdStr.startIndex.advancedBy(num - 4))
        
//        //转成NSString
//        let userIdString = NSString(format: userIdStr)
//        //用户id 前四位
//        let prefixId = userIdString.substringToIndex(4)
        //获取图片的名字
        let icon = user.objectForKey("icon")as!String
        //拼接图片完整地址
        self.Icon = "\(prefixStr)/\(prefixId)/\(userId)/medium/\(icon)"
        
        }else {
        self.userName = "匿名用户"
        self.Icon = ""
        
        }
        
        
        
        
        
    
    }
    

}
