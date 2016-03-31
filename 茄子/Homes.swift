//
//  home.swift
//  茄子
//
//  Created by jake on 16/3/29.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit

class Homes: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    let Cellforcollction =  "Cell"
    let Middleview:UIView = UIView.init()
    var collectinveiwany:AnyObject!
    let UnBigphoto:UIImage = UIImage.init()
    let UnderBigpicture:UIImageView = UIImageView.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUicollectionvew()
        RefreshConfig()
        let sc:All = All.init()
        sc.view.frame =  CGRectMake(0, 0, self.view.frame.width, self.view.frame.height / 4)
        (self.collectinveiwany as! UICollectionView).addSubview(sc.view)
        SetMiddleview()
        SetUnderBigPicture()

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
    
}
