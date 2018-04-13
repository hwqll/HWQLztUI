//
//  HWQCyclePicture.swift
//  HWQCyclePicture
//
//  Created by hwq on 2018/4/10.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

protocol hwqCyclePictureDelegate {
    //获取选中item的index
    func cycleSelectedItemAtIndex(index : Int)
}
//图像来源
enum imageSource : String {
    case location
    case http
}

class HWQCyclePicture: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellCount = 100 //cell数量
    
    var delegate : hwqCyclePictureDelegate?

    lazy var collectionView : UICollectionView = {
        //设置布局方式
        var layout = HWQFlowLayout()
        
        
        
        let colletionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        colletionView.bounces = false
        colletionView.isPagingEnabled = true
        colletionView.showsVerticalScrollIndicator = false
        colletionView.showsHorizontalScrollIndicator = false
        
        colletionView.register(CycleViewCell.self, forCellWithReuseIdentifier: String(describing: CycleViewCell.self))
        
        colletionView.dataSource = self
        colletionView.delegate = self
        
        return colletionView
        
    }()
    
    lazy var pageControl : UIPageControl = {
        let width : CGFloat = 150
        let height : CGFloat = 10
        let x = (bounds.width - width) * 0.5
        let y = bounds.height - height
        
        let pageControl = UIPageControl(frame: CGRect(x: x, y: y, width: width, height: height))
        pageControl.isUserInteractionEnabled = false
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.lightText
        
        return pageControl
    }()
    
    lazy var timer : Timer = {
        let timer = Timer(timeInterval: 2.0, target: self, selector: #selector(updateCell), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
        return timer
    }()
    
    var imageURLStringArray : [String]? {
        didSet {
            pageControl.numberOfPages = (imageURLStringArray?.count)!
            collectionView.reloadData()
            
            let indexPath = IndexPath(item: (imageURLStringArray?.count)! * cellCount, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        }
    }
    
    var imageIsLocationOrHttp : imageSource?
    
    var pageColor : UIColor? {
        didSet {
            pageControl.pageIndicatorTintColor = pageColor
        }
    }
    
    var currentPageColor : UIColor? {
        didSet {
            pageControl.currentPageIndicatorTintColor = currentPageColor
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(collectionView)
        self.addSubview(pageControl)
        
        timer.fireDate = Date(timeIntervalSinceNow: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func updateCell() {
        //获取显示的cell中的最后一个
        let indexPath = collectionView.indexPathsForVisibleItems.last
        if let indexPath = indexPath {
            //滚动到下一个cell
            let nextIndexPath = IndexPath(item: indexPath.item + 1, section: indexPath.section)
            collectionView.scrollToItem(at: nextIndexPath, at: .left, animated: true)
        }else {
            return
        }
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        timer.invalidate()
    }
    
    
}

extension HWQCyclePicture {
    //MARK: - collection view delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLStringArray!.count * 2 * cellCount
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CycleViewCell", for: indexPath) as! CycleViewCell
        
        cell.imageURLString = imageURLStringArray?[indexPath.item % imageURLStringArray!.count]
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.cycleSelectedItemAtIndex(index: indexPath.item % (imageURLStringArray?.count)!)
    }
    //MARK: - 手动滚动方法
    //开始手动拖动时
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //修改触发时间，就可以停止自动轮播
        timer.fireDate = Date.distantFuture
    }
//    //拖动结束，添加新的触发时间
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        timer.fireDate = Date(timeIntervalSinceNow: 2.0)
    }
    //手动滚动减速状态，快要结束
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let offsetx = scrollView.contentOffset.x
        let currentIndex = NSInteger(offsetx / bounds.width) //当前item索引
        let itemCount = collectionView.numberOfItems(inSection: 0)
        //第一个，移动到中间item
        if currentIndex == 0 {

            collectionView.contentOffset = CGPoint(x: offsetx + CGFloat((imageURLStringArray?.count)!) * CGFloat(cellCount) * bounds.width, y: 0)
        }else if currentIndex == itemCount - 1{//最后一个

            collectionView.contentOffset = CGPoint(x: offsetx - CGFloat((imageURLStringArray?.count)!) * CGFloat( cellCount) * bounds.width, y: 0)
        }
    }
    //MARK: - 自动滚动
    //结束滚动
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        scrollViewDidEndDecelerating(scrollView)
    }
    //正在滚动,设置page
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetx = scrollView.contentOffset.x
        let currentIndex = Int(offsetx / bounds.width)
        let currentPageIndex = currentIndex % (imageURLStringArray?.count)!
        pageControl.currentPage = currentPageIndex
    }
    
}
