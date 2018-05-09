//
//  ThingsToDoMenuTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 12/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol  ThingsToDoMenuDelegate:NSObjectProtocol {
    
    func actionCallBackSelectedImage(index:Int)
}
class ThingsToDoMenuTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var collectionView:UICollectionView?
    
    
    var delegate:ThingsToDoMenuDelegate?
    var imageList:[String]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
       self.collectionView?.register(UINib(nibName: NIBName.HomeSliderCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.HomeSliderCell)
        
    }
    
    
    
    func configureView(images:[String])  {
        
        self.imageList = images
        self.collectionView?.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ThingsToDoMenuTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let _ = self.imageList{
            return 1
        }else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let images = self.imageList{
            return images.count
        }else{
            return 0
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (ScreenSize.SCREEN_WIDTH / 3) - 10, height: (ScreenSize.SCREEN_WIDTH / 3) - 10)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.HomeSliderCell, for: indexPath) as! HomeSliderCollectionViewCell
        cell.configureMenuImage(image: self.imageList![indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let del = self.delegate{
            del.actionCallBackSelectedImage(index: indexPath.row)
        }
    }
  
    
}
