//
//  HWQFlowLayout.swift
//  HWQCyclePicture
//
//  Created by hwq on 2018/4/12.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class HWQFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        
        self.itemSize = (collectionView?.bounds.size)!
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal
    }
}
