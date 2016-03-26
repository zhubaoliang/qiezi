//
//  RegisterVC.swift
//  茄子
//
//  Created by jake on 16/3/25.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit
import Alamofire
class RegisterVC: UIViewController {
    let StatuRect: CGRect = UIApplication.sharedApplication().statusBarFrame
    let PhoneNumberTextFiled: UITextField = UITextField.init()
    let PasswdTextField: UITextField = UITextField.init()
    let RePasswdTextField: UITextField = UITextField.init()
    let VerifyNumForRegister: UITextField = UITextField.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        self.title = "注册"
        LableForView()
        BuildTextField()
        BuidButtonForVerifyNum()
        GestureForExitKeyBoard()
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
        VerifyNumber.frame = CGRectMake(0, 165,self.view.frame.width / 3, 35)
        VerifyNumber.textAlignment = NSTextAlignment.Right
        VerifyNumber.adjustsFontSizeToFitWidth = true
        self.view.addSubview(VerifyNumber)
    }
    
    func BuildTextField()
    {
        
        PhoneNumberTextFiled.frame = CGRectMake(self.view.frame.width / 4, 45, self.view.frame.width / 2, 35)
        PhoneNumberTextFiled.backgroundColor = UIColor.whiteColor()
        PhoneNumberTextFiled.layer.cornerRadius = 10
        PhoneNumberTextFiled.keyboardType = UIKeyboardType.NumberPad
        self.view.addSubview(PhoneNumberTextFiled)
        
        PasswdTextField.frame = CGRectMake(self.view.frame.width / 4, 85, self.view.frame.width / 2, 35)
        PasswdTextField.backgroundColor = UIColor.whiteColor()
        PasswdTextField.layer.cornerRadius = 10
        PasswdTextField.secureTextEntry = true
        self.view.addSubview(PasswdTextField)
        
        RePasswdTextField.frame = CGRectMake(self.view.frame.width / 4, 125, self.view.frame.width / 2, 35)
        RePasswdTextField.backgroundColor = UIColor.whiteColor()
        RePasswdTextField.layer.cornerRadius = 10
        RePasswdTextField.secureTextEntry = true
        self.view.addSubview(RePasswdTextField)
        
        VerifyNumForRegister.frame = CGRectMake(self.view.frame.width / 3, 165, self.view.frame.width / 3, 35)
        VerifyNumForRegister.layer.cornerRadius = 10
        VerifyNumForRegister.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(VerifyNumForRegister)
        
    }
    
    func BuidButtonForVerifyNum()
    {
        let VerifyNum:UIButton = UIButton.init()
        VerifyNum.layer.cornerRadius = 10
        VerifyNum.setTitle("获取验证码", forState: UIControlState.Normal)
        VerifyNum.backgroundColor =  UIColor.whiteColor()
        VerifyNum.frame = CGRectMake(self.view.frame.width * 3 / 4, 165, self.view.frame.width / 4, 35)
        VerifyNum.setTitle("获取验证码", forState: UIControlState.Normal)
        VerifyNum.addTarget(self, action: Selector("senderMessage"), forControlEvents: UIControlEvents.TouchUpInside)
        VerifyNum.showsTouchWhenHighlighted  = true
        VerifyNum.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.view.addSubview(VerifyNum)
        let NextStep: UIButton = UIButton.init()
        NextStep.frame = CGRectMake(self.view.frame.width / 2 - self.view.frame.width / 6, 210, self.view.frame.width / 3, 35)
        NextStep.backgroundColor = UIColor.whiteColor()
        NextStep.layer.cornerRadius  = 10
        NextStep.setTitle("下一步", forState: UIControlState.Normal)
        NextStep.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        NextStep.addTarget(self, action: Selector("NextStepFunction"), forControlEvents: UIControlEvents.TouchUpInside)
        NextStep.showsTouchWhenHighlighted = true
        self.view.addSubview(NextStep)
        
    
    }
    func NextStepFunction()
    {
        print("下一步")
        let Function:RegisterFunction = RegisterFunction.init()
        if( Function.VerifyNum(PhoneNumberTextFiled, PasswdField: PasswdTextField, Targetview: self, RepasswordField: RePasswdTextField,verfiynumer:VerifyNumForRegister) )
        {
            Function.RegisterYanZheng(PhoneNumberTextFiled, PasswdTextField: PasswdTextField, TargetView: self)
            self.navigationController?.popViewControllerAnimated(true)
        }
        
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
    
    func senderMessage()
    {
        print("发送验证码请求")
        let url = apiUrl+"SendMobileCode"
        let param = [
            "phone":PhoneNumberTextFiled.text!,
            
        ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
            }
            
        }
    }

    
}
