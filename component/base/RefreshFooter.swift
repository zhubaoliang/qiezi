//
//  RefreshFooter.swift
//  Refresh
//
//  Created by  lifirewolf on 16/3/3.
//  Copyright © 2016年  lifirewolf. All rights reserved.
//

import UIKit

class RefreshFooter: RefreshComponent {

    /** 创建footer */
//    static func footerWithRefreshingBlock(refreshingBlock: RefreshComponentRefreshingBlock) -> RefreshFooter {
//        let cmp = RefreshFooter()
//        cmp.refreshingBlock = refreshingBlock;
//        return cmp
//    }
    init(refreshingBlock: RefreshComponentRefreshingBlock) {
        super.init(frame: CGRectZero)
        self.refreshingBlock = refreshingBlock
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
//    static func footerWithRefreshingTarget(target: AnyObject, refreshingAction action: Selector) -> RefreshFooter {
//        let cmp = RefreshFooter()
//        cmp.setRefreshingTarget(target, refreshingAction: action)
//        return cmp
//    }
    
    /** 提示没有更多的数据 */
    func endRefreshingWithNoMoreData() {
        state = .NoMoreData
    }
    
    func noticeNoMoreData() {
        endRefreshingWithNoMoreData()
    }
    
//    - (void)noticeNoMoreData MJRefreshDeprecated("使用endRefreshingWithNoMoreData");
    
    /** 重置没有更多的数据（消除没有更多数据的状态） */
    func resetNoMoreData() {
        state = .Idle
    }
    
    /** 忽略多少scrollView的contentInset的bottom */
    var ignoredScrollViewContentInsetBottom: CGFloat = 0
    
    /** 自动根据有无数据来显示和隐藏（有数据就显示，没有数据隐藏。默认是NO） */
    var automaticallyHidden = false
    
    // MARK: - 重写父类的方法
    override func prepare() {
        super.prepare()
        // 设置自己的高度
        h = RefreshFooterHeight
        
        // 默认不会自动隐藏
        automaticallyHidden = false
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        
        if nil != newSuperview {
            // 监听scrollView数据的变化
            if scrollView is UITableView || scrollView is UICollectionView {
                scrollView.reloadDataBlock = { totalDataCount in
                    if self.automaticallyHidden {
                        self.hidden = totalDataCount == 0
                    }
                }
            }
        }
    }

}
