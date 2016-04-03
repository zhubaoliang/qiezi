//
//  home.swift
//  茄子
//
//  Created by jake on 16/3/29.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit
import Foundation
class Homes: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    let Cellforcollction =  "Cell"
    let Middleview:UIView = UIView.init()
    var collectinveiwany:AnyObject!
    let UnBigphoto:UIImage = UIImage.init()
    
    let scrollview: UIScrollView = UIScrollView.init()
    let pagecontrol: UIPageControl = UIPageControl.init()
    let imageNum: UILabel = UILabel.init()
    var totalNum: NSInteger = 0
    var timer: NSTimer = NSTimer.init()
    let containerview:UIView = UIView.init()
    
    
    let UnderBigpicture:UIImageView = UIImageView.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUicollectionvew()
        RefreshConfig()
        //sc.view.frame =  CGRectMake(0, 0, self.view.frame.width, self.view.frame.height / 4)
        //(self.collectinveiwany as! UICollectionView).addSubview(sc.view)
        SetMiddleview()
        SetUnderBigPicture()
       ////////////////////滚动图片
        SetFrame(CGRectMake(0, 0, self.view.frame.width, self.view.frame.height / 4) )
        self.setArray([UIImage.init(named: "homepage_p3.jpg")!,UIImage.init(named: "homepage_p4.jpg")!,UIImage.init(named: "homepage_pic1.jpg")!,UIImage.init(named: "homepage_pic2.jpg")!])
        self.openTimer()
        scrollview.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height / 4)
        (self.collectinveiwany as! UICollectionView).addSubview(scrollview)
        collectinveiwany.addSubview(containerview)
         //////////////

    }
    func SetUnderBigPicture()
    {
        
        UnderBigpicture.frame = CGRectMake(0, self.view.frame.height / 4 + 50 , self.view.frame.width, self.view.frame.height / 4)
        UnderBigpicture.backgroundColor = UIColor.blueColor()
        collectinveiwany.addSubview(UnderBigpicture)
        UnderBigpicture.image = UIImage.init(named: "homepage_p4.jpg")
    }
    
    
    func SetMiddleview()
    {
        Middleview.frame = CGRectMake(0, self.view.frame.height / 4, self.view.frame.width, 50)
        Middleview.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.1)
        self.collectinveiwany.addSubview(Middleview)
        let Title:UILabel = UILabel.init(frame: CGRectMake(self.view.frame.width / 2 - 50, 0, 100, 25))
        Title.text = "热门图片"
        Middleview.addSubview(Title)
        Title.tintColor = UIColor.redColor()
        Title.adjustsFontSizeToFitWidth = true
        Title.textAlignment = NSTextAlignment.Center
        let Direction1:UILabel = UILabel.init()
        Direction1.backgroundColor = UIColor.blueColor()
        Direction1.frame = CGRectMake(0, 25, self.view.frame.width,2)
        Direction1.backgroundColor  = UIColor.redColor()
        Middleview.addSubview(Direction1)
        let Direction2:UILabel = UILabel.init()
        Direction2.frame = CGRectMake(self.view.frame.width / 2 - 50 , 27, 100,1)
        Direction2.backgroundColor = UIColor.redColor()
        Middleview.addSubview(Direction2)
    
    }
    func SetUicollectionvew()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        let collectionView = UICollectionView(frame: CGRectMake(0,0,self.view.frame.width,self.view.frame.height - UINavigationController.init().navigationBar.frame.height - 46 - UIApplication.sharedApplication().statusBarFrame.height - 49 ), collectionViewLayout: layout)
    if( UIScreen.mainScreen().bounds.height == collectionView.frame.height)
    {
        print("equle")
        }
        collectionView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.1)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(collectioncell.self, forCellWithReuseIdentifier:Cellforcollction )
        collectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
        collectinveiwany = collectionView
        self.view.addSubview(collectionView)
    }
    
    
    
    func RefreshConfig()
    {
        (collectinveiwany as! UICollectionView).refreshHeader = RefreshNormalHeader{
        
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            (self.collectinveiwany as! UICollectionView).reloadData()
            
            // 结束刷新
            (self.collectinveiwany as! UICollectionView).refreshHeader.endRefreshing()
        }
        (self.collectinveiwany as! UICollectionView).refreshHeader.beginRefreshing()
    
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! collectioncell
        
        //cell.imageView.layer.cornerRadius = 15.0
        cell.imageView.layer.masksToBounds = true
        //cell.layer.shadowColor = UIColor.darkGrayColor().CGColor
       // cell.layer.shadowOffset = CGSizeMake(2, 2)
        //cell.layer.shadowRadius = 4.0
        //cell.layer.shadowOpacity = 0.9
        cell.layer.masksToBounds = false
        //cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 15.0).CGPath
        
        cell.imageView.image = UIImage(named: "default.png")
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "headView", forIndexPath: indexPath)
        headView.backgroundColor = UIColor.whiteColor()
        
        return headView
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // print("(\(indexPath.section),\(indexPath.row))")
        print("ddd")
        
        
        (self.collectinveiwany as! UICollectionView).refreshHeader.endRefreshing()
        let clean:CleanCash = CleanCash.init()
        clean.CleanCashForApp(self)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: UINavigationController.init().navigationBar.frame.height + UIApplication.sharedApplication().statusBarFrame.height + self.view.frame.height / 2 + 40 + 46)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        /*if  indexPath.row % 2 == 1{
        return CGSize(width: width/2, height: height/3)
        }
        else{
        return CGSize(width: width/2, height: height/2)
        }*/
        return CGSizeMake((self.view.frame.width - 10)/3, (self.view.frame.width - 20) / 3 + 50 );
    }
    
    
    //////////////////////////////////////////////////
    func SetFrame(frame: CGRect)
    {
        scrollview.frame = frame
        scrollview.backgroundColor = UIColor.purpleColor()
        scrollview.delegate = self
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.showsVerticalScrollIndicator = false
        scrollview.pagingEnabled = true
        self.view.addSubview(scrollview)
        containerview.backgroundColor = UIColor.clearColor()
        containerview.frame =   CGRectMake(0,scrollview.frame.height - 20, self.view.frame.size.width, 20)
        /*let alphaview:UIView = UIView.init(frame: CGRectMake(0,0, CGRectGetWidth(containerview.frame), CGRectGetHeight(containerview.frame)))
        alphaview.backgroundColor = UIColor.blueColor()
        alphaview.alpha = 0.7
        self.view.addSubview(alphaview)
        
        CGRectMake(0,scrollview.frame.height - 20, self.view.frame.size.width, 20)
        */
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
        
        timer = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: #selector(Homes.timerAction(_:)), userInfo: nil, repeats: true)
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
            for(var i:Int = 0 ; i < totalNum ; i += 1)
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
