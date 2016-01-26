//
//  NetworkHelper.swift
//  QiuBaiDemo
//
//  Created by wanghui on 16/1/25.
//  Copyright © 2016年 王辉. All rights reserved.
//

import UIKit

//声明一个协议
protocol NetworkHelperDelegate:NSObjectProtocol {
  //传值方法
    func passValue()
}

class NetworkHelper: NSObject {
    
    //声明一个属性
    var delegate:NetworkHelperDelegate!
    //数据源
  lazy var dataArray :NSMutableArray = NSMutableArray(capacity: 1)
    
    //声明一个结构体 存储静态变量
    struct NetworkManager {
    //声明一个静态变量
      static  var networkHelper:NetworkHelper!
        static var oncToken : dispatch_once_t = 0
}
    //单例方法 
    class  func ShardInstance() -> NetworkHelper  {
        
        
//        
//        if NetworkManager.networkHelper == nil {
//        NetworkManager.networkHelper = NetworkHelper()
//            
//        }
        //CGD写法  匿名函数,又叫闭包 {(参数....)-> 返回值类型 in }
        
//        let myBlock = {(number:Int)-> Void  in print(number)
//        }
//        
//        myBlock(5)      
        
        dispatch_once(&NetworkManager.oncToken) { () -> Void in
            NetworkManager.networkHelper = NetworkHelper()
            
        }
        
        
    return NetworkManager.networkHelper
    }
    
    
    //网络请求方法
    func getDataFromServer(urlStr:String,isTrue:Bool) {
        //创建url
        let url = NSURL(string:urlStr)
        //创建request
        let request = NSURLRequest(URL: url!)
        //发起网络请求
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse?, data:NSData?, error:NSError?) -> Void in
        let dic = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            //print(dic)
            
            if isTrue {
            //当前网络请求是刷新操作,移除旧数据源
                self.dataArray.removeAllObjects()
            }
            
            
           // 封装model
            let items = dic.objectForKey("items")as!NSArray
            for   dic in items {
                 let itemDic = dic as!NSDictionary
                //创建model
        let model = QiuBaiModel(dic: itemDic)
                print(model.Icon)
                self.dataArray.addObject(model)
        }
            
            //代理传值  如果传参数的方式
            if self.delegate  != nil && self.delegate.respondsToSelector("passValue") {
            
                self.delegate.passValue()
            }
          
        }
    }
    
}
