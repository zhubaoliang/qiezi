//
//  Main.swift
//  茄子
//
//  Created by jake on 16/3/18.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit

class Main: UITabBarController {
    let Pangesture:UIPanGestureRecognizer = UIPanGestureRecognizer.init()
    var flag: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        CreatTabItems()
        Pangesture.addTarget(self, action: ("PangG:"))
        self.view.addGestureRecognizer(Pangesture)
        
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
                switch item.tag
        {
                case 1:
                    print(item.tag)
                    NSNotificationCenter.defaultCenter().postNotificationName("hidden", object: nil)
                    flag = 1
                case 2:
                    print(item.tag)
                    NSNotificationCenter.defaultCenter().postNotificationName("Show", object: nil)
                    flag = 2
                case 3:
                    print(item.tag)
                    NSNotificationCenter.defaultCenter().postNotificationName("Show", object: nil)
                    flag = 3
                case 4:
                    print(item.tag)
                    NSNotificationCenter.defaultCenter().postNotificationName("Show", object: nil)
                    flag = 4
                case 5:
                    print(item.tag)
                    NSNotificationCenter.defaultCenter().postNotificationName("Show", object: nil)
                    flag = 5
                default:
                    print("Error")
        }
    }
    func CreatTabItems()
    {
        let Tabitem:CreatTabitems = CreatTabitems.init()
        Tabitem.Creatitem(self)
        
    }
    
    
    func PangG(recongnizer:UIPanGestureRecognizer)
    {
        let Gesture:UIGestureForMain = UIGestureForMain.init()
        Gesture.PangG(recongnizer, flag: flag, target: self)
                    }
    
}
