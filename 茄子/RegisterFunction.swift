//
//  RegisterFunction.swift
//  茄子
//
//  Created by jake on 16/3/26.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit
class RegisterFunction {
    func VerifyNum(PhoneNum:UITextField,PasswdField:UITextField,Targetview:UIViewController,RepasswordField:UITextField,verfiynumer:UITextField) ->Bool
    {
        if(PhoneNum.text?.characters.count != 11 )
        {
            let AlertVC:UIAlertController = UIAlertController.init(title: "提示", message: "号码不正确，请检查！", preferredStyle: UIAlertControllerStyle.Alert)
            let AlertButton:UIAlertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Default, handler:{Void in })
            AlertVC.addAction(AlertButton)
            Targetview.presentViewController(AlertVC, animated: true, completion: nil)
            return false
        }
        else if(PasswdField.text?.characters.count == 0)
        {
            let AlertVC:UIAlertController = UIAlertController.init(title: "提示", message: "密码不能为空", preferredStyle: UIAlertControllerStyle.Alert)
            let AlertButton:UIAlertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Default, handler:{Void in })
            AlertVC.addAction(AlertButton)
            Targetview.presentViewController(AlertVC, animated: true, completion: nil)
            return false
        }else if(PasswdField.text != RepasswordField.text)
        {
            let AlertVC:UIAlertController = UIAlertController.init(title: "提示", message: "密码输入不一致！", preferredStyle: UIAlertControllerStyle.Alert)
            let AlertButton:UIAlertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Default, handler:{Void in })
            AlertVC.addAction(AlertButton)
            Targetview.presentViewController(AlertVC, animated: true, completion: nil)
            return false
            
        
        }
        else if(VerifyForRegisterDepend()){
            let AlertVC:UIAlertController = UIAlertController.init(title: "提示", message: "密码输入不一致！", preferredStyle: UIAlertControllerStyle.Alert)
            let AlertButton:UIAlertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Default, handler:{Void in })
            AlertVC.addAction(AlertButton)
            Targetview.presentViewController(AlertVC, animated: true, completion: nil)
            return false;
        
        }
        return true
    }
    func VerifyForRegisterDepend() ->Bool
    {
        print("验证码验证")
        return true
    }
}
