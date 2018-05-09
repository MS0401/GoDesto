//
//  HomeDetailFacilitiesTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HomeDetailFacilitiesTableViewCell: BaseTableViewCell {

    @IBOutlet weak var collectionView:UICollectionView?
    
    var facilitiesList:[FacilitiesViewModel] = [FacilitiesViewModel]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
         self.collectionView?.register(UINib(nibName: NIBName.HotelDetailFacilitiesItemCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.HomeDetailFacilitiesCollectionViewCell)
    }
    
    func configureView(list:[FacilitiesViewModel])  {
        self.facilitiesList = list
        self.collectionView?.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeDetailFacilitiesTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.facilitiesList.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: 70, height: self.collectionView!.frame.size.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.HomeDetailFacilitiesCollectionViewCell, for: indexPath) as! HomeDetailFacilitiesCollectionViewCell
        cell.configureView(facility: self.facilitiesList[indexPath.row])
        return cell
        
    }
    
    
}
