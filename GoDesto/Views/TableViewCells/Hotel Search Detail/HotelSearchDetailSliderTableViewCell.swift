//
//  HotelSearchDetailSliderTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
import Cosmos

class HotelSearchDetailSliderTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewTopSpace:NSLayoutConstraint?
    @IBOutlet weak var collectionViewBottomSpace:NSLayoutConstraint?
    
    @IBOutlet weak var viewRating:CosmosView?
    
    @IBOutlet weak var collectionView:UICollectionView?
    @IBOutlet weak var lblName:UILabel?
    @IBOutlet weak var lblAddress:UILabel?
    @IBOutlet weak var pageControll:UIPageControl?
    
    var hotelDetail:HotelDetailViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.collectionView?.register(UINib(nibName: NIBName.HomeSliderCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.HomeSliderCell)
        print(UserLogin.foodingAdds.count)
        self.pageControll?.numberOfPages = Home.HomeAdds.count
        
    }
    
    func configureView(detail:HotelDetailViewModel)  {
        self.hotelDetail = detail
        self.pageControll?.numberOfPages = self.hotelDetail!.images.count
        self.lblName?.text = detail.hotelInfo.name
        self.lblAddress?.text = detail.hotelInfo.hotelAddress
        self.viewRating?.rating = Double(detail.hotelInfo.rating)!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func actionNext(_ sender:UIButton){
        
    }
    
}
extension HotelSearchDetailSliderTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let _ = self.hotelDetail{
            return 1
        }
        return 0
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.hotelDetail!.images.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.size.width, height: self.collectionView!.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.HomeSliderCell, for: indexPath) as! HomeSliderCollectionViewCell
        
        cell.configureView(image:self.hotelDetail!.images[indexPath.row])
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = self.collectionView?.indexPathsForVisibleItems.first{
            self.pageControll?.currentPage = indexPath.item
        }
        
    }
    
}


