//
//  RegisterFunction.swift
//  茄子
//
//  Created by jake on 16/3/26.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
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
            let AlertVC:UIAlertController = UIAlertController.init(title: "提示", message: "验证码不正确！", preferredStyle: UIAlertControllerStyle.Alert)
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
        return false
    }
    
    func RegisterYanZheng(NumberTxtField:UITextField,PasswdTextField:UITextField,TargetView:UIViewController) {
        let url = apiUrl+"UserVerify"
        let param = [
            "phone":NumberTxtField.text!,
            "code":PasswdTextField.text!
        ]
        print(url)
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("====================")
                let status = Httpresult(JSONDecoder(json!))
                print(JSONDecoder(json!))
                print("状态是")
                print(status.status)
                if(status.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(TargetView.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = status.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 3)
                    
                    
                }
                
                if(status.status == "success"){
                    let userid = NSUserDefaults.standardUserDefaults()
                    userid.setValue(status.data?.id, forKey: "userid")
                    //let uid = userid.valueForKey("userid")
                   
                    
                
                }
                
            }
            
        }

    
    }

}