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
    let home: Home1 = Home1.init()
    let message:Message = Message.init()
    let mine:Mine = Mine.init()
    let mypai:Mypai = Mypai.init()
    func Creatitem(target:UITabBarController)
    {
        let image1: UIImage = UIImage.init(named: "default.png")!
        let item1 : UITabBarItem = UITabBarItem.init(title: "", image: image1.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage.init(named: "default.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        let image2: UIImage = UIImage.init(named: "default.png")!
        let item2 : UITabBarItem = UITabBarItem.init(title: "活动", image: UIImage.init(named: "default.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: image2.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        let image3: UIImage = UIImage.init(named: "default.png")!
        let item3 : UITabBarItem = UITabBarItem.init(title: "我要拍", image: image3.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage.init(named: "default.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        let image4: UIImage = UIImage.init(named: "default.png")!
        let item4: UITabBarItem = UITabBarItem.init(title: "消息", image: image4.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage.init(named: "default.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        let image5: UIImage = UIImage.init(named: "default.png")!
        let item5 : UITabBarItem = UITabBarItem.init(title: "我", image: image5.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage.init(named: "default.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
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
