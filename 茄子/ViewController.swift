//
//  ViewController.swift
//  茄子
//
//  Created by jake on 16/3/18.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let TabView:Main = Main()
    let Dra:Draw = Draw.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.Hiddenbar), name: "hidden", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.ShowBar), name: "Show", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.push(_:)), name: "push", object: nil)
       self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(Dra.view)
        self.view.addSubview(TabView.view)
        
        
        
    
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.translucent = false
    }
    
    
    func push(noti:NSNotification)
    {
        let vc:AnyObject = noti.object!
        self.navigationController?.pushViewController(vc as! UIViewController, animated: true)
        
    }
    
    func Hiddenbar()
    {
        print("hidden")
        self.navigationController?.navigationBarHidden = true
    }
    
    func ShowBar()
    {
        print("show")
        self.navigationController?.navigationBarHidden = false
    }


}

