//
//  FilterCuisineTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 23/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class FilterCuisineTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var collectionView:UICollectionView?
    
    var optionsList:[FilterOptionViewModel]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView?.register(UINib(nibName: NIBName.FilterCuisineCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.FilterCuisineCollectionViewCell)
        
        self.lblTitle?.text = "Popular Cuisines"
        
    }
    func configure(list:[FilterOptionViewModel])  {
        self.optionsList = list
        self.collectionView?.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
extension FilterCuisineTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let _ = self.optionsList{
            return 1
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.optionsList!.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: (self.frame.size.width/5) - 2, height: 90)
        return CGSize(width: 73, height: 90)
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.FilterCuisineCollectionViewCell, for: indexPath) as! FilterCuisineCollectionViewCell
        cell.configure(option: self.optionsList![indexPath.row])
        
        return cell
        
    }
    
    
}
