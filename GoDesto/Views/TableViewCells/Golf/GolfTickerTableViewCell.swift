//
//  GolfTickerTableViewCell.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/30/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class GolfTickerTableViewCell: BaseTableViewCell {

    @IBOutlet weak var golfTickerCollectionV:UICollectionView?
    
    var isFromHotelDetail:Bool? = false
    override func awakeFromNib() {

        super.awakeFromNib()
        
        self.golfTickerCollectionV?.register(UINib(nibName: "GolfTickerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GolfTickerCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
}

extension GolfTickerTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(self.isFromHotelDetail!){
            return Global.shared.detail.hotelDetailOptionList.count
        }else{
            return Global.shared.detail.optionList.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 75, height: self.golfTickerCollectionV!.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(self.isFromHotelDetail!){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GolfTickerCollectionViewCell", for: indexPath) as! GolfTickerCollectionViewCell
            cell.configureOption(option: Global.shared.detail.hotelDetailOptionList[indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GolfTickerCollectionViewCell", for: indexPath) as! GolfTickerCollectionViewCell
            cell.configure(option: Global.shared.detail.optionList[indexPath.row])
            return cell
        }
    }
    
}
