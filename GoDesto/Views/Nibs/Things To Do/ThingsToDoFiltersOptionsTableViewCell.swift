//
//  ThingsToDoFiltersOptionsTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol ThingsToDoFiltersOptionsDelegate:NSObjectProtocol {
    func actionCallBackShowMoreFilters(index:Int,itemIndex:Int)
}

class ThingsToDoFiltersOptionsTableViewCell: BaseTableViewCell {

    @IBOutlet weak var collectionView:UICollectionView?
    @IBOutlet weak var lblTitle:UILabel?
    
    var optionList:[ToDoFilterOptionViewModel]?
    var index:Int = 0
    
    var delegate:ThingsToDoFiltersOptionsDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView?.register(UINib(nibName: NIBName.HomeMenuItemCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.HomeMenuItemCell)
    }
    
    func configure(list:[ToDoFilterOptionViewModel],index:Int)  {
        self.index = index
        self.optionList = list
        self.collectionView?.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ThingsToDoFiltersOptionsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let _ = self.optionList{
            return 1
        }else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            return CGSize(width: (self.collectionView!.frame.size.width/4) - 10, height: 140)
            
        }else {
            
            return CGSize(width: (self.collectionView!.frame.size.width/4) - 10, height: 100)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.HomeMenuItemCell, for: indexPath) as! HomeMenuItemCollectionViewCell
        cell.configureFilter(option: self.optionList![indexPath.row])
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
       
        let cell = collectionView.cellForItem(at: indexPath) as! HomeMenuItemCollectionViewCell
        
        let option = self.optionList![indexPath.row]
        if(option.isSelected){
            option.isSelected = false
        }else{
            option.isSelected = true
        }
        cell.configureFilter(option: option)
        
        
        if let del = self.delegate{
            del.actionCallBackShowMoreFilters(index: self.index,itemIndex: indexPath.row)
        }
    }
}
