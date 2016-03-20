//
//  School.swift
//  茄子
//
//  Created by jake on 16/3/8.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit

class School: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = false
        self.view.backgroundColor = UIColor.yellowColor()
        let btn:UIButton = UIButton.init()
        btn.frame = CGRectMake(0, 0, 300, 40)
        btn.backgroundColor = UIColor.redColor()
        btn.addTarget(self, action: Selector("test"), forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(btn)
        
        
    }
    func test()
    {
        let test:Graduate = Graduate.init()
        NSNotificationCenter.defaultCenter().postNotificationName("push", object: test)
    }
}