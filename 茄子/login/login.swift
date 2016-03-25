//
//  login.swift
//  茄子
//
//  Created by jake on 16/3/15.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit
class login: UIViewController {
    let userName:UILabel = UILabel.init()
    let passWord:UILabel = UILabel.init()
    let LoginButton:UIButton = UIButton.init()
    let CancelButton:UIButton = UIButton.init()
    let ForgetPassWord:UIButton = UIButton.init()
    let userField:UITextField = UITextField.init()
    let passField:UITextField = UITextField.init()
    let status:CGRect = UIApplication.sharedApplication().statusBarFrame
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.grayColor()
        
        BuildLable()
        BuidTextFiled()
        BuilduserPhoto()
        BuidButton()
        GestureForExitKeyBoard()
        
    }
    
    
    
    override func viewWillAppear(var animated: Bool) {
        animated = false
        self.title = "登录"
        self.navigationController?.navigationBarHidden = false
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let attribute: NSDictionary  = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName )
        self.navigationController!.navigationBar.titleTextAttributes = attribute as? [String : AnyObject]
        self.navigationController!.navigationBar.barTintColor = UIColor.blackColor()
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.tabBarController?.tabBar.hidden = true
        //NSNotificationCenter.defaultCenter().postNotificationName("Show", object: nil)
        
    }
    func BuildLable()
    {
        userName.backgroundColor = UIColor.grayColor()
        userName.frame = CGRectMake(self.view.frame.width / 4 - self.view.frame.width / 7, self.view.frame.height * 3 / 9 + (self.navigationController?.navigationBar.frame.height)!, self.view.frame.width / 7, 35)
        userName.text = "账号"
        self.view.addSubview(userName)
        passWord.backgroundColor = UIColor.grayColor()
        passWord.frame = CGRectMake(self.view.frame.width / 4 - self.view.frame.width / 7, self.view.frame.height * 3 / 9 + 50 + (self.navigationController?.navigationBar.frame.height)!, self.view.frame.width / 7, 35)
        passWord.text = "密码"
        self.view.addSubview(passWord)
    }
    
    func BuidTextFiled()
    {
        userField.frame = CGRectMake(self.view.frame.width / 4 , self.view.frame.height * 3 / 9 + (self.navigationController?.navigationBar.frame.height)!, self.view.frame.width / 2, 35)
        userField.backgroundColor = UIColor.whiteColor()
        userField.layer.cornerRadius = 10
        passField.frame = CGRectMake(self.view.frame.width / 4 , self.view.frame.height * 3 / 9 + 50 + (self.navigationController?.navigationBar.frame.height)!, self.view.frame.width / 2, 35)
        passField.layer.cornerRadius = 10
        passField.backgroundColor = UIColor.whiteColor()
        passField.secureTextEntry = true
        self.view.addSubview(userField)
        self.view.addSubview(passField)
    }
    
    func BuilduserPhoto()
    {
            let User: UIImageView = UIImageView.init(frame: CGRectMake(self.view.frame.width / 4, status.height + (self.navigationController?.navigationBar.frame.height)!, self.view.frame.width / 2, self.view.frame.width / 2))
            User.layer.masksToBounds = true
            User.layer.cornerRadius = self.view.frame.width / 4
            User.layer.borderWidth = 2
            User.layer.borderColor = UIColor.whiteColor().CGColor
            User.image = UIImage.init(named: "user.jpg")
            User.userInteractionEnabled = true
            self.view.addSubview(User)
    }
    func BuidButton()
    {
        LoginButton.frame = CGRectMake(self.view.frame.width / 2 - self.view.frame.width * 9 / 28 - 5, self.view.frame.height * 3 / 9 + 130 + (self.navigationController?.navigationBar.frame.height)!, self.view.frame.width * 9 / 28, 40)
        LoginButton.backgroundColor = UIColor.orangeColor()
        LoginButton.setTitle("登录", forState: UIControlState.Normal)
        LoginButton.layer.cornerRadius = 10
        LoginButton.showsTouchWhenHighlighted = true
        LoginButton.addTarget(self, action: Selector("UserVerify"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(LoginButton)
        CancelButton.frame = CGRectMake(self.view.frame.width / 2 + 5 , self.view.frame.height * 3 / 9 + 130 + (self.navigationController?.navigationBar.frame.height)!, self.view.frame.width * 9 / 28, 40)
        CancelButton.backgroundColor = UIColor.orangeColor()
        CancelButton.setTitle("注册", forState: UIControlState.Normal)
        CancelButton.layer.cornerRadius = 10
        CancelButton.showsTouchWhenHighlighted = true
        self.view.addSubview(CancelButton)
        ForgetPassWord.frame = CGRectMake(self.view.frame.width / 2 + 5, self.view.frame.height * 3 / 9  + 190 + (self.navigationController?.navigationBar.frame.height)!, self.view.frame.width * 9 / 28, 20)
        ForgetPassWord.setTitle("忘记密码", forState: UIControlState.Normal)
        ForgetPassWord.backgroundColor = UIColor.grayColor()
        ForgetPassWord.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        ForgetPassWord.showsTouchWhenHighlighted = true
        ForgetPassWord.addTarget(self, action: Selector("ForGetView"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(ForgetPassWord)
    }
    
    
    func ForGetView()
    {
        let FORGETP:ForgetPassWordView = ForgetPassWordView.init()
        self.navigationController?.pushViewController(FORGETP, animated: true)
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
    
    func UserVerify()
    {
        let verify: Loginfunc = Loginfunc.init()
        verify.ResiterVerifyNumberLength(self, Username: userField)
        verify.Loginverify(userField, PasswdField: passField)
        
    }
    
}
