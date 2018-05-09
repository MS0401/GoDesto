//
//  HomeSliderTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 17/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HomeSliderTableViewCell: BaseTableViewCell {
    
    
    @IBOutlet weak var collectionViewTopSpace:NSLayoutConstraint?
    @IBOutlet weak var collectionViewBottomSpace:NSLayoutConstraint?
    @IBOutlet weak var collectionView:UICollectionView?
    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var lblSubtitle:UILabel?
    @IBOutlet weak var pageControll:UIPageControl?
    @IBOutlet weak var viewInfo:UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.collectionView?.register(UINib(nibName: NIBName.HomeSliderCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.HomeSliderCell)
        
        if let splash = Global.shared.splashInfo{
            self.pageControll?.numberOfPages = splash.landingImages.count
        }else{
            self.pageControll?.numberOfPages = 0
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func actionNext(_ sender:UIButton){
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 0 {
            // scrolling up
            self.collectionView!.clipsToBounds = true
            self.collectionViewBottomSpace?.constant = -scrollView.contentOffset.y / 2
            self.collectionViewTopSpace?.constant = scrollView.contentOffset.y / 2
        } else {
            // scrolling down
            self.collectionViewTopSpace?.constant = scrollView.contentOffset.y
            self.collectionView!.clipsToBounds = false
        }
    }

}
extension HomeSliderTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let splash = Global.shared.splashInfo{
            return splash.landingImages.count
        }else{
            return 0
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width, height: self.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.HomeSliderCell, for: indexPath) as! HomeSliderCollectionViewCell
        cell.configureData(image: Global.shared.splashInfo!.landingImages[indexPath.row])
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = self.collectionView?.indexPathsForVisibleItems.first{
            self.pageControll?.currentPage = indexPath.item
        }
        
    }
    
}
