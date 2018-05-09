//
//  FilterOptionsTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class FilterOptionsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var collectionView:UICollectionView?
    
    var optionsList:[FilterOptionViewModel]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView?.register(UINib(nibName: NIBName.FilterOptionCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.FilterOptionCollectionViewCell)
        
        self.lblTitle?.text = "Top options"
        
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
extension FilterOptionsTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
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
            return CGSize(width: (self.frame.size.width/3) - 7, height: 90)
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.FilterOptionCollectionViewCell, for: indexPath) as! FilterOptionCollectionViewCell
        cell.configure(option: self.optionsList![indexPath.row])
        
        return cell
        
    }
    
    
}

