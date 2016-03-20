//
//  UIGestureForMain.swift
//  茄子
//
//  Created by jake on 16/3/20.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit
class UIGestureForMain {
    


func PangG(recongnizer:UIPanGestureRecognizer ,flag:Int,target:UIViewController)
{
    
    let translation: CGPoint = recongnizer.translationInView(recongnizer.view)
    let rightScopeTransform:CGAffineTransform = CGAffineTransformTranslate((UIApplication.sharedApplication().delegate?.window!?.transform)!, UIScreen.mainScreen().bounds.size.width * 0.8, 0)
    if (recongnizer.view!.transform.tx>rightScopeTransform.tx) {
        recongnizer.view!.transform=rightScopeTransform
    }
    let leftScopeTransform:CGAffineTransform = CGAffineTransformTranslate((UIApplication.sharedApplication().delegate?.window!?.transform)!, 0, 0)
    if(target.view.frame.origin.x == 0 && translation.x < 0)
    {
        return
    }
    if (recongnizer.view!.transform.tx<0.0)
    {
        
        recongnizer.view?.transform = leftScopeTransform
    }
    
    if(recongnizer.state == UIGestureRecognizerState.Ended)
    {
        if( target.view.frame.origin.x >= target.view.frame.width  / 4)
        {
            UIView.animateWithDuration(0.5, animations: {
                target.view.transform = CGAffineTransformMakeTranslation(target.view.frame.width * 0.8, 0)
            })
        }
        else
        {
            if( target.view.frame.origin.x < target.view.frame.width  / 4)
            {
                UIView.animateWithDuration(0.5, animations: {
                    target.view.transform = CGAffineTransformMakeTranslation(0, 0)
                })
            }
        }
    }
    if(flag == 1 )
    {
        
        
        print(translation.x)
        recongnizer.view!.transform = CGAffineTransformTranslate(recongnizer.view!.transform, translation.x, 0)
        recongnizer.setTranslation(CGPointZero, inView: recongnizer.view)
        
        
    }
}
}