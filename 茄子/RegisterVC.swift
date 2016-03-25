//
//  RegisterVC.swift
//  茄子
//
//  Created by jake on 16/3/25.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    let StatuRect: CGRect = UIApplication.sharedApplication().statusBarFrame
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        self.title = "注册"
        LableForView()
        BuildTextField()
    }
    
    func LableForView()
    {
        let TopTitle:UILabel = UILabel.init()
        TopTitle.text = "欢迎加入123茄子"
        TopTitle.frame = CGRectMake(self.view.frame.width / 4,  0, self.view.frame.width / 2, 40)
        let attribute: NSDictionary  = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName )
        self.navigationController!.navigationBar.titleTextAttributes = attribute as? [String : AnyObject]
        TopTitle.textAlignment = NSTextAlignment.Center
        TopTitle.textColor  = UIColor.redColor()
        TopTitle.adjustsFontSizeToFitWidth = true
        self.view.addSubview(TopTitle)
        let PhoneNumberLable:UILabel = UILabel.init()
        PhoneNumberLable.text = "手机号"
        PhoneNumberLable.frame = CGRectMake(0, 45,self.view.frame.width / 4, 35)
        PhoneNumberLable.adjustsFontSizeToFitWidth = true
        PhoneNumberLable.textAlignment = NSTextAlignment.Right
        self.view.addSubview(PhoneNumberLable)
        let Passwd: UILabel = UILabel.init()
        Passwd.text = "密码"
        Passwd.frame = CGRectMake(0, 85,self.view.frame.width / 4, 35)
        Passwd.adjustsFontSizeToFitWidth = true
        Passwd.textAlignment = NSTextAlignment.Right
        self.view.addSubview(Passwd)
        let RePasswd: UILabel = UILabel.init()
        RePasswd.text = "再次输入"
        RePasswd.frame = CGRectMake(0, 125,self.view.frame.width / 4, 35)
        RePasswd.adjustsFontSizeToFitWidth = true
        RePasswd.textAlignment = NSTextAlignment.Right
        RePasswd.adjustsFontSizeToFitWidth = true
        self.view.addSubview(RePasswd)
        let VerifyNumber:UILabel = UILabel.init()
        VerifyNumber.text = "输入收到的验证码"
        VerifyNumber.frame = CGRectMake(0, 135,self.view.frame.width / 4, 35)
        self.view.addSubview(VerifyNumber)
    }
    
    func BuildTextField()
    {
        let PhoneNumberTextFiled: UITextField = UITextField.init()
        PhoneNumberTextFiled.frame = CGRectMake(self.view.frame.width / 4, 45, self.view.frame.width / 2, 35)
        PhoneNumberTextFiled.backgroundColor = UIColor.whiteColor()
        PhoneNumberTextFiled.layer.cornerRadius = 10
        self.view.addSubview(PhoneNumberTextFiled)
        let PasswdTextField: UITextField = UITextField.init()
        PasswdTextField.frame = CGRectMake(self.view.frame.width / 4, 85, self.view.frame.width / 2, 35)
        PasswdTextField.backgroundColor = UIColor.whiteColor()
        PasswdTextField.layer.cornerRadius = 10
        self.view.addSubview(PasswdTextField)
        let RePasswdTextField: UITextField = UITextField.init()
        RePasswdTextField.frame = CGRectMake(self.view.frame.width / 4, 125, self.view.frame.width / 2, 35)
        RePasswdTextField.backgroundColor = UIColor.whiteColor()
        RePasswdTextField.layer.cornerRadius = 10
        self.view.addSubview(RePasswdTextField)
        print("dd")
        
    }
    
}
