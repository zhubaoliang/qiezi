//
//  UIScrollview.swift
//  茄子
//
//  Created by jake on 16/3/30.
//  Copyright © 2016年 茄子. All rights reserved.
//

/*import UIKit
class UIScrollviews: UIScrollView,UIScrollViewDelegate {
    let pagecontrol: UIPageControl = UIPageControl.init()
    var totalNum: NSInteger = 0
    var timer: NSTimer = NSTimer.init()
    let imageNum: UILabel = UILabel.init()
    var frames:CGRect = CGRect.init()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        print(frames)
        backgroundColor = UIColor.purpleColor()
        self.delegate = self
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.pagingEnabled = true
        self.setArray([UIImage.init(named: "homepage_p3.jpg")!,UIImage.init(named: "homepage_p4.jpg")!,UIImage.init(named: "homepage_pic1.jpg")!,UIImage.init(named: "homepage_pic2.jpg")!])
        self.openTimer()
        
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
                img.frame = CGRectMake(CGFloat( i) * bounds.width , 0, CGRectGetWidth(bounds), CGRectGetHeight(bounds))
                img.contentMode = UIViewContentMode.ScaleAspectFill
                img.image = imagArray[i]
                img.tag = i
                self.addSubview(img)
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
            img.frame = CGRectMake(0, 0, CGRectGetWidth(bounds), CGRectGetHeight(bounds))
            img.image = UIImage.init(named: "user.jpg")
            img.userInteractionEnabled = true
            self.addSubview(img)
            imageNum.text = "no data"
        }
        self.contentSize = CGSizeMake(CGRectGetWidth(bounds) * CGFloat( totalNum),CGRectGetHeight(bounds))
    }
    
    
    
    func timerAction(times:NSTimer)
    {
        let depend:Bool = totalNum > 1
        if(depend)
        {
            var newOffset: CGPoint = self.contentOffset
            newOffset.x = newOffset.x + CGRectGetWidth(bounds)
            let offdepend:Bool = newOffset.x > (CGRectGetWidth(bounds) * CGFloat(totalNum-1))
            if(offdepend)
            {
                newOffset.x = 0
            }
            let index: Int = Int (newOffset.x / CGRectGetWidth(bounds))
            newOffset.x = CGFloat(index) * CGRectGetWidth(self.frame)
            imageNum.text = NSString(format: "%d / %ld", index + 1,totalNum) as String
            self.setContentOffset(newOffset, animated: true)
            
        }
        else
        {
            timer.fireDate = NSDate.distantFuture()
        }
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let depend:Bool = self.isMemberOfClass(UITableView.classForCoder())
        if(depend)
        {
            
        }
        else
        {
            let index:Int = Int( fabs((self.contentOffset.x) / bounds.size.width))
            pagecontrol.currentPage = index
            for view in self.subviews
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
    
    
    func openTimer()
    {
        timer.fireDate = NSDate.distantPast()
        
    }
    func closeTime()
    {
        timer.fireDate = NSDate.distantPast()
    }


}*/
