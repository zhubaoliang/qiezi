//
//  SetNavgationbar.swift
//  茄子
//
//  Created by jake on 16/3/20.
//  Copyright © 2016年 茄子. All rights reserved.
//

/*import UIKit

class SetNavgationbar{
    let Tool:UIToolbar = UIToolbar.init()
    let all:All = All.init()
    let Nav:UINavigationBar = UINavigationBar.init()
    let Titilescroll: UIScrollView = UIScrollView.init()
    let rect: CGRect = UIApplication.sharedApplication().statusBarFrame
    let school:School = School.init()
    let streetphoto :Streetphoto = Streetphoto.init()
    let graduate :Graduate = Graduate.init()
    let snow:Snow = Snow.init()
    let Button1: UIButton = UIButton.init(frame: CGRectMake(0, 0, 100, 46))
    internal var targets:UINavigationController = UINavigationController.init()
    func Functions(target:UINavigationController)
    {
        
        Buildbar(target)
        SetToolbar(target)
        SetUserPhoto(target)
        SetNavigationbar(target)
        SetTitilescrollview(target)
        SetButtonForTitleScrollview(target)
    
    }
    func Buildbar(target:UINavigationController)
    {
        Nav.frame = CGRectMake(0, 0, (target.navigationBar.frame.width), (target.navigationBar.frame.height) + rect.height)
        target.view.addSubview(Nav)
    }
    
    func SetUserPhoto(target:UINavigationController)
    {
        let User: UIImageView = UIImageView.init(frame: CGRectMake(10, 0, target.navigationBar.frame.height, target.navigationBar.frame.height))
        User.layer.masksToBounds = true
        User.layer.cornerRadius = target.navigationBar.frame.height / 2
        User.layer.borderWidth = 2
        User.layer.borderColor = UIColor.whiteColor().CGColor
        User.image = UIImage.init(named: "user.jpg")
        User.userInteractionEnabled = true
        let TouchGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: Selector("Ueraction"))
        User.addGestureRecognizer(TouchGesture)
        Tool.addSubview(User)
    }
    
    func SetTitilescrollview(target:UINavigationController)
    {
        
        Titilescroll.backgroundColor = UIColor.blackColor()
        Titilescroll.frame = CGRectMake(0, (target.navigationBar.frame.height) + rect.height + 1,target.view.frame.width , 46)
        Titilescroll.contentSize = CGSizeMake(500 , 0)
        target.automaticallyAdjustsScrollViewInsets = false
    }
    
    func SetNavigationbar(target:UINavigationController)
    {
        target.title = "主页"
        Nav.barTintColor = UIColor.blackColor()
        Nav.translucent = false
    }
    
    func SetToolbar(target:UINavigationController)
    {
        Tool.frame = CGRectMake(0, 20, target.view.frame.width, 40)
        Tool.backgroundColor = UIColor.blackColor()
        Tool.barTintColor = UIColor.blackColor()
        Tool.translucent = false
        target.view.addSubview(Tool)
        let titilelable:UILabel = UILabel.init()
        titilelable.frame = CGRectMake(target.view.frame.width / 2 - 25 , 0 , 50 , Tool.frame.height )
        titilelable.text = "推荐"
        titilelable.backgroundColor = UIColor.blackColor()
        titilelable.textColor = UIColor.whiteColor()
        Tool.addSubview(titilelable)
    }
    
    func SetButtonForTitleScrollview(target:UINavigationController)
    {
        
        Button1.backgroundColor = UIColor.blackColor()
        Button1.setTitle("全部", forState: UIControlState.Normal)
        Button1.addTarget(self, action: Selector("Buttonaction:"), forControlEvents: UIControlEvents.TouchDown)
        Button1.tag = 1
        self.Titilescroll.addSubview(Button1)
        let Button2: UIButton = UIButton.init(frame: CGRectMake(100, 0, 100, 46))
        Button2.backgroundColor = UIColor.blackColor()
        Button2.setTitle("校园", forState: UIControlState.Normal)
        Button2.addTarget(self, action: Selector("Buttonaction:"), forControlEvents: UIControlEvents.TouchDown)
        Button2.tag = 2
        self.Titilescroll.addSubview(Button2)
        let Button3: UIButton = UIButton.init(frame: CGRectMake(200, 0, 100, 46))
        Button3.backgroundColor = UIColor.blackColor()
        Button3.addTarget(self, action: Selector("Buttonaction:"), forControlEvents: UIControlEvents.TouchDown)
        Button3.tag = 3
        Button3.setTitle("街拍", forState: UIControlState.Normal)
        self.Titilescroll.addSubview(Button3)
        let Button4: UIButton = UIButton.init(frame: CGRectMake(300, 0, 100, 46))
        Button4.backgroundColor = UIColor.blackColor()
        Button4.setTitle("唯美毕业季", forState: UIControlState.Normal)
        Button4.addTarget(self, action: Selector("Buttonaction:"), forControlEvents: UIControlEvents.TouchDown)
        Button4.tag = 4
        self.Titilescroll.addSubview(Button4)
        let Button5: UIButton = UIButton.init(frame: CGRectMake(400, 0, 100, 46))
        Button5.backgroundColor = UIColor.blackColor()
        Button5.setTitle("雪景", forState: UIControlState.Normal)
        Button5.addTarget(self, action: Selector("Buttonaction:"), forControlEvents: UIControlEvents.TouchDown)
        Button5.tag = 5
        self.Titilescroll.addSubview(Button5)
        target.view.addSubview(Titilescroll)
        
    }
    func bb()
    {
        print("dds")
    }
    func Buttonaction(btn:UIButton)
    {
        switch btn.tag
        {
        case 1:
            Clearviews(targets)
            all.view = SetFrameForViewOfTitleview(all,target: targets)
            targets.view.addSubview(all.view)
        case 2 :
            Clearviews(targets)
            school.view = SetFrameForViewOfTitleview(school,target: targets)
            targets.view.addSubview(school.view)
            
        case 3 :
            Clearviews(targets)
            streetphoto.view = SetFrameForViewOfTitleview(streetphoto,target: targets)
            targets.view.addSubview(streetphoto.view)
        case 4 :
            Clearviews(targets)
            graduate.view = SetFrameForViewOfTitleview(graduate,target: targets)
            targets.view.addSubview(graduate.view)
        case 5 :
            Clearviews(targets)
            snow.view = SetFrameForViewOfTitleview(snow,target: targets)
            targets.view.addSubview(snow.view)
        default:
            print("null")
            
        }
    }
    
    func Clearviews (target:UINavigationController)
    {    let views: [UIView] = target.view.subviews
        for willdestroyed in views
        {
            if(willdestroyed == self.all.view || willdestroyed == self.streetphoto.view || willdestroyed == school.view || willdestroyed == graduate.view || willdestroyed == snow.view)
            {
                willdestroyed.removeFromSuperview()
                
            }
        }
        
    }
    
    func SetFrameForViewOfTitleview(willset:UIViewController,target:UINavigationController) ->UIView
    {
        
        willset.view.frame = CGRectMake(0, (target.navigationBar.frame.height) + rect.height + 1 + 46, target.view.frame.width, target.view.frame.height - (target.navigationBar.frame.height) - rect.height - 47 - 49 )
        return willset.view
    }
    
}*/
