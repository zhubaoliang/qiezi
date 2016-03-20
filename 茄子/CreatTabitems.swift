//
//  CreatTabitems.swift
//  茄子
//
//  Created by jake on 16/3/20.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit
class CreatTabitems {
    let activity:Activity = Activity.init()
    let home: Home = Home.init()
    let message:Message = Message.init()
    let mine:Mine = Mine.init()
    let mypai:Mypai = Mypai.init()
    func Creatitem(target:UITabBarController)
    {
        let image1: UIImage = UIImage.init(named: "default")!
        let item1 : UITabBarItem = UITabBarItem.init(title: "主页", image: image1.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: image1.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        let image2: UIImage = UIImage.init(named: "default")!
        let item2 : UITabBarItem = UITabBarItem.init(title: "活动", image: image2.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: image2.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        let image3: UIImage = UIImage.init(named: "default")!
        let item3 : UITabBarItem = UITabBarItem.init(title: "我要拍", image: image3.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: image3.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        let image4: UIImage = UIImage.init(named: "default")!
        let item4: UITabBarItem = UITabBarItem.init(title: "消息", image: image4.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: image4.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        let image5: UIImage = UIImage.init(named: "default")!
        let item5 : UITabBarItem = UITabBarItem.init(title: "我", image: image5.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: image5.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        home.tabBarItem = item1
        home.tabBarItem.tag = 1
        activity.tabBarItem = item2
        activity.tabBarItem.tag = 2
        mypai.tabBarItem = item3
        mypai.tabBarItem.tag = 3
        message.tabBarItem = item4
        message.tabBarItem.tag = 4
        mine.tabBarItem = item5
        mine.tabBarItem.tag = 5
        target.viewControllers = [home,activity,mypai,message,mine]
    }
    
    }
