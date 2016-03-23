//
//  Mine.swift
//  茄子
//
//  Created by jake on 16/3/8.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit

class Mine: UIViewController {
    let BackgroundImageView:UIImageView = UIImageView.init()
    let Staturect:CGRect = UIApplication.sharedApplication().statusBarFrame
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        SetBackgroundImage()
        
    }
    func SetBackgroundImage()
    {
        BackgroundImageView.frame = CGRectMake(0,Staturect.height , self.view.frame.width, self.view.frame.height * 3 / 9)
            let BackgroundImage:UIImage = UIImage.init(named: "drawbg.jpg")!
        BackgroundImageView.image = BackgroundImage
        self.view.addSubview(BackgroundImageView)
    
    }
}