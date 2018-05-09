//
//  HomeSliderPopularTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 17/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

protocol HomeSliderPopularDelegate:NSObjectProtocol {
    func actionCallBaclSelectMenuItem(index:Int)
    func actionSelectPopularItem(index:Int,cellIndex:Int)
}
class HomeSliderPopularTableViewCell: BaseTableViewCell {

    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var collectionView:UICollectionView?
    
    
    var delegate:HomeSliderPopularDelegate?
    var infoList:[HomeInfoViewModel]?
    var cellIndex:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
         self.collectionView?.register(UINib(nibName: NIBName.HomeSliderPopularItemCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.HomePopularItemsCell)
        
       
    }

//    func configureView()  {
//        if(self.isPopularListing!){
//            self.topViewHeight.constant = 50
//            let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.scrollDirection = UICollectionViewScrollDirection.horizontal
//            layout?.minimumLineSpacing = 10
//            layout?.minimumInteritemSpacing = 10
//            self.collectionView?.backgroundColor = UIColor.white
//
//        }else{
//            self.topViewHeight.constant = 0
//            let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
//            layout?.scrollDirection = UICollectionViewScrollDirection.vertical
//            layout?.minimumLineSpacing = 1
//            layout?.minimumInteritemSpacing = 0
//            self.collectionView?.backgroundColor = UIColor.groupTableViewBackground
//        }
//        //self.collectionView?.reloadData()
//    }
    
    func configureView(info:[HomeInfoViewModel],index:Int)  {
        
        self.infoList = info
        self.cellIndex = index
        self.collectionView?.reloadData()
        
        if info.count > 1 {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                self.collectionView?.scrollToItem(at: IndexPath(row: 1, section: 0),
                                                  at: .centeredHorizontally,
                                                  animated: false)
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
extension HomeSliderPopularTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let _ = self.infoList{
            return 1
        }else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
             return self.infoList!.count
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            return CGSize(width: 350, height: self.collectionView!.frame.size.height)
            
        }else {
            return CGSize(width: 250, height: self.collectionView!.frame.size.height)
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.HomePopularItemsCell, for: indexPath) as! HomeSliderPopularItemCollectionViewCell
                cell.configureView(info: self.infoList![indexPath.row])
        //   cell.configureView()
            return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if let del = self.delegate{
            del.actionSelectPopularItem(index: indexPath.row,cellIndex: self.cellIndex)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("item deselect")
    }
    
}

