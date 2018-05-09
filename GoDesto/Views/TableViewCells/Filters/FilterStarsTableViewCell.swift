//
//  FilterStarsTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class FilterStarsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var collectionView:UICollectionView?
    
    var starList:[FilterStarsViewModel]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         self.collectionView?.register(UINib(nibName: NIBName.FilterStarCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.FilterStarCollectionViewCell)
        self.lblTitle?.text = "Filter by stars"
    }
    
    func configure(list:[FilterStarsViewModel])  {
        self.starList = list
        self.collectionView?.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension FilterStarsTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let _ = self.starList{
            return 1
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.starList!.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 40)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let totalCellWidth = 40 * 5
        let totalSpacingWidth = 10 * (5 - 1)

        let leftInset = (self.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset

        return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.FilterStarCollectionViewCell, for: indexPath) as! FilterStarCollectionViewCell
        cell.configure(star: self.starList![indexPath.row])
        return cell
        
    }
    
    
}
