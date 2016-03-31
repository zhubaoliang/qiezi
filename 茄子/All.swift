//
//  All.swift
//  茄子
//
//  Created by jake on 16/3/20.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit

class All: UIViewController ,UIScrollViewDelegate{
    let scrollview: UIScrollView = UIScrollView.init()
    let pagecontrol: UIPageControl = UIPageControl.init()
    let imageNum: UILabel = UILabel.init()
    var totalNum: NSInteger = 0
    var timer: NSTimer = NSTimer.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetFrame(CGRectMake(0, 0, self.view.frame.width, self.view.frame.height / 4) )
        self.setArray([UIImage.init(named: "homepage_p3.jpg")!,UIImage.init(named: "homepage_p4.jpg")!,UIImage.init(named: "homepage_pic1.jpg")!,UIImage.init(named: "homepage_pic2.jpg")!])
        self.view.backgroundColor = UIColor.redColor()
        self.openTimer()
    }
    func SetFrame(frame: CGRect)
    {
        scrollview.frame = frame
        scrollview.backgroundColor = UIColor.purpleColor()
        scrollview.delegate = self
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.showsVerticalScrollIndicator = false
        scrollview.pagingEnabled = true
        self.view.addSubview(scrollview)
        let containerview:UIView = UIView.init(frame: CGRectMake(0,scrollview.frame.height - 20, self.view.frame.size.width, 20))
        containerview.backgroundColor = UIColor.clearColor()
        self.view.addSubview(containerview)
        /*let alphaview:UIView = UIView.init(frame: CGRectMake(0,0, CGRectGetWidth(containerview.frame), CGRectGetHeight(containerview.frame)))
        alphaview.backgroundColor = UIColor.blueColor()
        alphaview.alpha = 0.7
        self.view.addSubview(alphaview)*/
        pagecontrol.frame = CGRectMake(10, 0, CGRectGetWidth(containerview.frame)-20, 20)
        pagecontrol.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        pagecontrol.currentPage = 0
        containerview.addSubview(pagecontrol)
        imageNum.frame = CGRectMake(self.view.frame.width -  70,0,70, 20)
        imageNum.font = UIFont.boldSystemFontOfSize(15)
        imageNum.backgroundColor = UIColor.clearColor()
        imageNum.textColor = UIColor.whiteColor()
        imageNum.textAlignment = NSTextAlignment.Right
        containerview.addSubview(imageNum)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: Selector("timerAction:"), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
        timer.fireDate = NSDate.distantFuture()
        
        
    }
    func timerAction(times:NSTimer)
    {
        let depend:Bool = totalNum > 1
        if(depend)
        {
            var newOffset: CGPoint = scrollview.contentOffset
            newOffset.x = newOffset.x + CGRectGetWidth(scrollview.frame)
            let offdepend:Bool = newOffset.x > (CGRectGetWidth(scrollview.frame) * CGFloat(totalNum-1))
            if(offdepend)
            {
                newOffset.x = 0
            }
            let index: Int = Int (newOffset.x / CGRectGetWidth(scrollview.frame))
            newOffset.x = CGFloat(index) * CGRectGetWidth(scrollview.frame)
            imageNum.text = NSString(format: "%d / %ld", index + 1,totalNum) as String
            scrollview.setContentOffset(newOffset, animated: true)
            
        }
        else
        {
            timer.fireDate = NSDate.distantFuture()
        }
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let depend:Bool = scrollview.isMemberOfClass(UITableView.classForCoder())
        if(depend)
        {
            
        }
        else
        {
            let index:Int = Int( fabs((scrollview.contentOffset.x) / scrollview.frame.size.width))
            pagecontrol.currentPage = index
            for view in scrollview.subviews
            {
                if(view.tag == index)
                {
                    
                }
                else
                {
                    
                }
            }
        }
    }
    func setArray(imagArray:[UIImage])
    {
        totalNum = imagArray.count
        let depend:Bool = totalNum > 0
        if(depend)
        {
            for(var i:Int = 0 ; i < totalNum ; i++)
            {
                let img:UIImageView = UIImageView.init()
                img.frame = CGRectMake(CGFloat( i) * CGRectGetWidth(scrollview.frame), 0, CGRectGetWidth(scrollview.frame), self.view.frame.height / 4)
                img.contentMode = UIViewContentMode.ScaleAspectFill
                img.image = imagArray[i]
                img.tag = i
                scrollview.addSubview(img)
            }
            imageNum.text = NSString(format: "%d / %ld", pagecontrol.currentPage + 1 ,totalNum) as String
            pagecontrol.numberOfPages = totalNum
            var frame: CGRect
            frame = pagecontrol.frame
            frame.size.width =  15 *  CGFloat( totalNum)
            pagecontrol.frame = frame
            
        }
        else
        {
            let img:UIImageView = UIImageView.init()
            img.frame = CGRectMake(0, 0, CGRectGetWidth(scrollview.frame), CGRectGetHeight(scrollview.frame))
            img.image = UIImage.init(named: "user.jpg")
            img.userInteractionEnabled = true
            scrollview.addSubview(img)
            imageNum.text = "no data"
        }
        scrollview.contentSize = CGSizeMake(CGRectGetWidth(scrollview.frame) * CGFloat( totalNum),CGRectGetHeight(scrollview.frame))
    }
    func openTimer()
    {
        timer.fireDate = NSDate.distantPast()
        
    }
    func closeTime()
    {
        timer.fireDate = NSDate.distantPast()
    }

}