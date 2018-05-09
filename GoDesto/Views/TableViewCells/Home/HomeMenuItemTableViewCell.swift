//
//  HomeMenuItemTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 23/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HomeMenuItemTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var collectionView:UICollectionView?
    
     var delegate:HomeSliderPopularDelegate?
    var catList:[HomeCategoryViewModel]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.collectionView?.register(UINib(nibName: NIBName.HomeMenuItemCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.HomeMenuItemCell)
    }

    func configureView(categoryList:[HomeCategoryViewModel]) {
        self.catList = categoryList
        self.collectionView?.reloadData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension HomeMenuItemTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,HomeMenuItemDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let _ = self.catList{
            return 1
        }else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.catList!.count//Home.HomeMenu.count
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            return CGSize(width: (self.frame.size.width/4) - 0.5, height: 140)
            
        }else {
            
            return CGSize(width: (self.frame.size.width/4) - 0.5, height: 100)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.HomeMenuItemCell, for: indexPath) as! HomeMenuItemCollectionViewCell
            //cell.configureView(item: Home.HomeMenu[indexPath.row],index: indexPath.row)
        cell.configureItem(cat: self.catList![indexPath.row],index: indexPath.row)
        cell.delegate = self
            return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
            if let del = self.delegate{
                del.actionCallBaclSelectMenuItem(index: indexPath.row)
            }
      
    }
    func actionCallBackSelectItem(index:Int) {
        if let del = self.delegate{
            del.actionCallBaclSelectMenuItem(index: index)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("item deselect")
    }
    
}
