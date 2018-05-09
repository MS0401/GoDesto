//
//  RoomInfoCell.swift
//  GoDesto
//
//  Created by Le Abid on 18/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
import Cosmos

class HotelInfoCell: UITableViewCell {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var imagePageControl: UIPageControl!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var viewRating: CosmosView!
    
    var hotelDetail:HotelDetailViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCollectionView.register(UINib(nibName: NIBName.ImageViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.ImageViewCell)
    }
}

extension HotelInfoCell {
    class func instance() -> HotelInfoCell {
        return Bundle.main.loadNibNamed(NIBName.HotelInfoCell, owner: nil, options: nil)?.first as! HotelInfoCell
    }
}

extension HotelInfoCell {
    
    func configureView(detail: HotelDetailViewModel)  {
        hotelDetail = detail
        imagePageControl.numberOfPages = hotelDetail!.images.count
        lblName.text = detail.hotelInfo.name
        lblAddress.text = detail.hotelInfo.hotelAddress
        viewRating.rating = Double(detail.hotelInfo.rating)!
        imageCollectionView.reloadData()
    }
    
}

extension HotelInfoCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let _ = self.hotelDetail{
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.hotelDetail!.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.ImageViewCell, for: indexPath) as! ImageViewCell
        cell.configureView(image:self.hotelDetail!.images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = imageCollectionView.indexPathsForVisibleItems.first{
            self.imagePageControl.currentPage = indexPath.item
        }
    }
}

