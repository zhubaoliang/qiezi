//
//  ResigesiterGetCode.swift
//  茄子
//
//  Created by jake on 16/3/25.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit
import Alamofire

class Loginfunc {
    func ResiterVerifyNumberLength(Targetview:UIViewController,Username:UITextField)
    {
        
        if(Username.text?.characters.count != 11)
        {
            
            let AlertVC:UIAlertController = UIAlertController.init(title: "提示", message: "号码过短，请检查！", preferredStyle: UIAlertControllerStyle.Alert)
            let AlertButton:UIAlertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Default, handler:{Void in })
            AlertVC.addAction(AlertButton)
            Targetview.presentViewController(AlertVC, animated: true, completion: nil)
        
        }
    
    }
    
    func Loginverify(Username:UITextField,PasswdField:UITextField)
    {
        let url = apiUrl+"applogin"
        let param = ["phone":Username.text!,
            "password":PasswdField.text!]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else
            {
                print("request是")
                print(request!)
                print("response是")
                print(response!)
                print("data是")
                print(json!)
                print("====================")
            
            }
            let result = Httpresult(JSONDecoder(json!))
            print("状态是")
            print(result.status)
            if(result.status == "error"){
                print("登录失败")
            }
            if(result.status == "success"){
                print("Success")
                
                
                
            }

    
    }
        
    }

}


