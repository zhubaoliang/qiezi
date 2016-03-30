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
    let width = UIScreen.mainScreen().bounds.width
    let height = UIScreen.mainScreen().bounds.height
    var collectinveiwany:AnyObject!
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUicollectionvew()
        RefreshConfig()
    }
    func SetUicollectionvew()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: CGRectMake(0,0,width,height), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.whiteColor()
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
        
        cell.imageView.layer.cornerRadius = 15.0
        cell.imageView.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.darkGrayColor().CGColor
        cell.layer.shadowOffset = CGSizeMake(2, 2)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 0.9
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 15.0).CGPath
        
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
        return CGSize(width: width, height: 17)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        /*if  indexPath.row % 2 == 1{
        return CGSize(width: width/2, height: height/3)
        }
        else{
        return CGSize(width: width/2, height: height/2)
        }*/
        return CGSizeMake((self.view.frame.width - 20)/2, (self.view.frame.width - 20) / 2 + 50 );
    }
    
}
