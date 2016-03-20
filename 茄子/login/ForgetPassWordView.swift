//
//  ForgetPassWord.swift
//  茄子
//
//  Created by jake on 16/3/16.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit
class ForgetPassWordView: UIViewController {
    let TellNumbreField:UITextField = UITextField.init()
    let CheckNumbre:UITextField = UITextField.init()
    let CheckBTN:UIButton = UIButton.init()
    let NextStep:UIButton = UIButton.init()
    let Statu:CGRect = UIApplication.sharedApplication().statusBarFrame
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        CreatTellNumberField()
        CheckButton()
        GestureForExitKeyBoard()
        NextStepFunction()
    }
    
    override func viewWillAppear(var animated: Bool) {
        animated = false
        self.title = "忘记密码"
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let attribute: NSDictionary  = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName )
        self.navigationController!.navigationBar.titleTextAttributes = attribute as? [String : AnyObject]
    }
    
    func CreatTellNumberField()
    {
        TellNumbreField.frame = CGRectMake(self.view.frame.width / 6, Statu.height + (self.navigationController?.navigationBar.frame.height)! + 20, self.view.frame.width * 2 / 3, 45)
        TellNumbreField.backgroundColor = UIColor.whiteColor()
        TellNumbreField.layer.cornerRadius = 10
        TellNumbreField.placeholder = "手机号"
        self.view.addSubview(TellNumbreField)
        CheckNumbre.frame = CGRectMake(self.view.frame.width / 6, Statu.height + (self.navigationController?.navigationBar.frame.height)! + 80, self.view.frame.width * 2 / 3, 45)
        CheckNumbre.backgroundColor = UIColor.whiteColor()
        CheckNumbre.layer.cornerRadius = 10
        CheckNumbre.placeholder = "验证码"
        self.view.addSubview(CheckNumbre)
    }
    func CheckButton()
    {
        CheckBTN.frame = CGRectMake(self.view.frame.width / 6 + self.view.frame.width * 2 / 3 - 90 , Statu.height + (self.navigationController?.navigationBar.frame.height)! + 80, 90, 45)
        CheckBTN.titleLabel?.font = UIFont.systemFontOfSize(14, weight: 20)
        CheckBTN.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        CheckBTN.setTitle("|获取验证码", forState: UIControlState.Normal)
        self.view.addSubview(CheckBTN)
        CheckBTN.showsTouchWhenHighlighted = true
        
    }
    
    func NextStepFunction()
    {
        NextStep.frame = CGRectMake(self.view.frame.width / 4, Statu.height + (self.navigationController?.navigationBar.frame.height)! + 135, self.view.frame.width / 2, 45)
        NextStep.backgroundColor = UIColor.greenColor()
        NextStep.layer.cornerRadius = 10
        NextStep.setTitle("下一步", forState: UIControlState.Normal)
        NextStep.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        NextStep.addTarget(self, action: Selector("PushToSetNewPassword"), forControlEvents: UIControlEvents.TouchUpInside)
        NextStep.showsTouchWhenHighlighted = true
        self.view.addSubview(NextStep)
    }
    
    func PushToSetNewPassword()
    {
        let NewVc:SetNewPassword = SetNewPassword.init()
        self.navigationController?.pushViewController(NewVc, animated: true)
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
