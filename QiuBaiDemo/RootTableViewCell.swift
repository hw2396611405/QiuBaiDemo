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
    var userView: UIView!//评论View
    var userComments:UILabel!//评论
    var userFunny:UILabel!//好笑
    var useface1 :UIButton!//笑脸
    var useface2 :UIButton!//苦脸
   
    
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
        self.userContent.font = UIFont.systemFontOfSize(15)
        self.userContent.numberOfLines = 0
        self.userContent.backgroundColor = UIColor.blueColor()
        self.contentView.addSubview(self.userContent)
        
 
        let funnyFrame = CGRectMake(10, 80, 100, 30)
        self.userFunny = UILabel(frame: funnyFrame)
        self.contentView.addSubview(userFunny)
        
        let commentsFrame = CGRectMake(150,80, 100, 30)
        self.userComments = UILabel(frame: commentsFrame)
        self.contentView.addSubview(userComments)
        
        let faceFrame1 = CGRectMake(10, 110, 30, 30)
        self.useface1 = UIButton(frame: faceFrame1)
        let image1 = UIImage(named: "3.jpg")
        self.useface1.setImage(image1, forState: UIControlState.Normal)
        self.contentView.addSubview(useface1)
        
        let  faceFrame2 = CGRectMake(60, 110, 30, 30)
        self.useface2 = UIButton(frame: faceFrame2)
        let image2 = UIImage(named: "4.jpg")
        self.useface2.setImage(image2, forState: UIControlState.Normal)
        self.contentView.addSubview(useface2)
        
    }
    
    //改变控件的frame 
    func changeSubViewFrame(model:QiuBaiModel)
    {
        //获取文本的高度
        let height = RootTableViewCell.calcuteCellHeight(model)
     var contentFrame = self.userContent.frame
        contentFrame.size.height = height
        //设置新的frame
        self.userContent.frame = contentFrame
        
        self.userComments.frame.origin.y = height + 40
        self.userFunny.frame.origin.y = height + 40
        
        self.useface1.frame.origin.y = height+70
        self.useface2.frame.origin.y = height+70
        
        
        
        

    }
    
//这个方法没有什么作用 出错的时候会调用这个方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //计算cell的高度
    class  func calcuteCellHeight(model:QiuBaiModel) ->CGFloat
    {
        //获取文本内容
       let content = model.userContact
       let contentSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, CGFloat.max)
       let attributes = [NSFontAttributeName:UIFont.systemFontOfSize(15)]
        let size = content.boundingRectWithSize(contentSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes:attributes , context: nil).size
        
        return size.height
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



