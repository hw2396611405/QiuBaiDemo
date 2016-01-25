//
//  RootTableViewCell.swift
//  QiuBaiDemo
//
//  Created by wanghui on 16/1/25.
//  Copyright © 2016年 王辉. All rights reserved.
//

import UIKit

class RootTableViewCell: UITableViewCell {
    
    var userIcon :UIImageView! //用户头像
    var userNickName:UILabel!//用户昵称
    var userContent:UILabel! //用户发表内容
    //当前屏幕宽度
    let width = UIScreen.mainScreen().bounds.width
    
    override  init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:reuseIdentifier)
        
        //加载子控件
        self.loadSubViews()
        
    }
    //加载子控件
    func loadSubViews() {
    //初始化用户头像
        let iconFrame = CGRectMake(0, 0, 40, 40);
        self.userIcon = UIImageView(frame: iconFrame)
        self.userIcon.backgroundColor = UIColor.redColor()
        self.userIcon.layer.cornerRadius = 20
        self.userIcon.layer.masksToBounds = true
        self.contentView.addSubview(self.userIcon)
        //初始化用户昵称
        let NickFrame = CGRectMake(CGRectGetMaxX(iconFrame), 0,width-CGRectGetMaxX(iconFrame) , 40)
        self.userNickName = UILabel(frame: NickFrame)
        self.userNickName.backgroundColor = UIColor.greenColor()
        self.contentView.addSubview(self.userNickName)
        
        //初始化用户发表内容
        let contentFrame = CGRectMake(0, CGRectGetMaxY(iconFrame), UIScreen.mainScreen().bounds.width, 40)
        self.userContent = UILabel(frame: contentFrame)
        self.userContent.backgroundColor = UIColor.blueColor()
        self.contentView.addSubview(self.userContent)
    }
    
//这个方法没有什么作用 出错的时候会调用这个方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}



