//
//  SetNewPassword.swift
//  茄子
//
//  Created by jake on 16/3/16.
//  Copyright © 2016年 茄子. All rights reserved.
//
import UIKit

class SetNewPassword: UIViewController {
    let NewLable:UILabel = UILabel.init()
    let CheckLale:UILabel = UILabel.init()
    let NewField:UITextField = UITextField.init()
    let CheckField:UITextField = UITextField.init()
    let FinishBTN:UIButton = UIButton.init()
    let Statu:CGRect = UIApplication.sharedApplication().statusBarFrame
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        SetLable()
        SetTextField()
        GestureForExitKeyBoard()
        SetButton()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = "设置新密码"
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let attribute: NSDictionary  = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName )
        self.navigationController!.navigationBar.titleTextAttributes = attribute as? [String : AnyObject]
    }
    
    func SetLable()
    {
        NewLable.frame = CGRectMake(self.view.frame.width / 20,Statu.height + (self.navigationController?.navigationBar.frame.height)! + 20, self.view.frame.width / 5, 40)
        NewLable.text = "新密码"
        NewLable.backgroundColor = UIColor.grayColor()
        self.view.addSubview(NewLable)
        CheckLale.frame = CGRectMake(self.view.frame.width / 20,Statu.height + (self.navigationController?.navigationBar.frame.height)! + 70, self.view.frame.width / 5, 40)
        CheckLale.text = "再次输入"
        CheckLale.backgroundColor = UIColor.grayColor()
        self.view.addSubview(CheckLale)
    }
    
    func SetTextField()
    {
        NewField.frame = CGRectMake(self.view.frame.width / 20 + self.view.frame.width / 5 ,Statu.height + (self.navigationController?.navigationBar.frame.height)! + 20 , self.view.frame.width * 3 / 5, 40)
        NewField.backgroundColor = UIColor.whiteColor()
        NewField.layer.cornerRadius = 10
        self.view.addSubview(NewField)
        CheckField.frame = CGRectMake(self.view.frame.width / 20 + self.view.frame.width / 5 ,Statu.height + (self.navigationController?.navigationBar.frame.height)! + 70 , self.view.frame.width * 3 / 5, 40)
        CheckField.backgroundColor = UIColor.whiteColor()
        CheckField.layer.cornerRadius = 10
        self.view.addSubview(CheckField)
    }
    
    func SetButton()
    {
        FinishBTN.frame = CGRectMake(self.view.frame.width / 2 - self.view.frame.width  / 5, Statu.height + (self.navigationController?.navigationBar.frame.height)! + 150, self.view.frame.width * 2 / 5, 40)
        FinishBTN.backgroundColor = UIColor.greenColor()
        FinishBTN.setTitle("完成", forState: UIControlState.Normal)
        FinishBTN.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        FinishBTN.layer.cornerRadius = 10
        FinishBTN.addTarget(self, action: Selector("PopToRoot"), forControlEvents: UIControlEvents.TouchUpInside)
        FinishBTN.showsTouchWhenHighlighted = true
        self.view.addSubview(FinishBTN)
    }
    
    func PopToRoot()
    {
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[1])!, animated: true)
    }
    
    func GestureForExitKeyBoard()
    {
        let ExitKeyBoard:UIGestureRecognizer = UITapGestureRecognizer.init(target: self, action: Selector("ExitkeyBoard:"))
        ExitKeyBoard.cancelsTouchesInView = false
        self.view.addGestureRecognizer(ExitKeyBoard)
    }
    
    func ExitkeyBoard(ExitKeyBoard:UITapGestureRecognizer)
    {
        self.view.endEditing(true)
    }
}

