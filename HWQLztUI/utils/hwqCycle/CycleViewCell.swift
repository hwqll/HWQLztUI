//
//  CycleCell.swift
//  HWQCyclePicture
//
//  Created by hwq on 2018/4/10.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class CycleViewCell: UICollectionViewCell {
    
    lazy var imageView : UIImageView = {
        let imageView = UIImageView(frame: bounds)
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    var imageIsLocationOrHttp : imageSource?
    
    var imageURLString : String? {
        didSet {
            
            switch imageIsLocationOrHttp ?? .location {
            case .location:
                imageView.image = UIImage(named: imageURLString!)
            case .http:
                //从网络加载，占位语句
                imageView.image = UIImage()
    
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(imageView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
