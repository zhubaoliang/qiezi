//
//  collectioncell.swift
//  茄子
//
//  Created by jake on 16/3/30.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit
class collectioncell: UICollectionViewCell {
    var imageView  = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.frame = bounds
        imageView.contentMode = .ScaleAspectFill
    }
}
