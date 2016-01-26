//
//  RootTableViewController.swift
//  QiuBaiDemo
//
//  Created by wanghui on 16/1/25.
//  Copyright © 2016年 王辉. All rights reserved.
//

import UIKit


class RootTableViewController: UITableViewController,NetworkHelperDelegate{
    //默认请求第一页的数据
    var page = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        //注册cell 这个的self相当与class
        self.tableView.registerClass(RootTableViewCell.self, forCellReuseIdentifier: "Cell")
        //成为网络请求工具类的代理
        NetworkHelper.ShardInstance().delegate = self
        
        let UrlStr = "http://m2.qiushibaike.com/article/list/text?count=30&page=1"
        //发起网络请求
        NetworkHelper.ShardInstance().getDataFromServer(UrlStr, isTrue: true)
        
        self.tableView.addHeaderWithTarget(self, action:"refreshData")
        self.tableView.addFooterWithTarget(self, action:"loadMoreData")
        //添加foot
        
        
        
        //self.tableView.rowHeight = 80

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    //下拉刷新的逻辑处理
    func refreshData() {
        //把page置为1,请求最新的数据
        self.page = 1
        let urlStr = "http://m2.qiushibaike.com/article/list/text?count=30&page=\(page)"
        print(urlStr)
        //发起网络请求
        NetworkHelper.ShardInstance().getDataFromServer(urlStr, isTrue: true)
        
    }
    //上拉加载的逻辑处理
    
    func  loadMoreData()
    {
        self.page++
        let urlStr = "http://m2.qiushibaike.com/article/list/text?count=30&page=\(page)"
        //发起网络请求
        NetworkHelper.ShardInstance().getDataFromServer(urlStr, isTrue: false)
    }

    
    //MARK : 实现工具类代理方法
    
    func passValue() {
        //根据page来判断当前网络请求成功的数据是下拉加载还是上来加载
        if page == 1 {
        //下拉刷新完成,结束动画
            self.tableView.headerEndRefreshing()
        }else {
        //上拉加载完成 结束动画
            self.tableView.footerEndRefreshing()
        
        }
        
        self.tableView.reloadData()
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return NetworkHelper.ShardInstance().dataArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //as 关键字 类型强转
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RootTableViewCell
        let model = NetworkHelper.ShardInstance().dataArray[indexPath.row]as!QiuBaiModel;
        cell.changeSubViewFrame(model)
        cell.userNickName.text = model.userName
        cell.userContent.text = model.userContact
        cell.userIcon.sd_setImageWithURL(NSURL(string: model.Icon))
        cell.userFunny.text = "200 好笑"
        cell.userComments.text = "10评论"

        // Configure the cell...

        return cell
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let model = NetworkHelper.ShardInstance().dataArray[indexPath.row] as! QiuBaiModel
      let heigth =  RootTableViewCell.calcuteCellHeight(model)
        return heigth + 100
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
