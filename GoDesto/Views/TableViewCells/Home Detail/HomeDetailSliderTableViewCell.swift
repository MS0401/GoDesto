//
//  HomeDetailSliderTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 19/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

protocol HomeDetailSliderDelegate:NSObjectProtocol {
    func  actionCallBackShowMenu()
    func  actionCallBookNow()
    func  actionCallBackShare()
    func actionCallBackShowGoogleMap()
}

class HomeDetailSliderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionViewTopSpace:NSLayoutConstraint?
    @IBOutlet weak var collectionViewBottomSpace:NSLayoutConstraint?
    @IBOutlet weak var collectionView:UICollectionView?
    @IBOutlet weak var pageControll:UIPageControl?
    @IBOutlet weak var viewBottomMenu:UIView?
    @IBOutlet weak var btnBookNow:UIButton?
    
    var delegate:HomeDetailSliderDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.btnBookNow?.layer.cornerRadius = 5
        
         self.collectionView?.register(UINib(nibName: NIBName.HomeSliderCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.HomeSliderCell)
        self.pageControll?.numberOfPages = UserLogin.foodingAdds.count
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func actionShowMenu(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackShowMenu()
        }
    }
    @IBAction func actionBookNow(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBookNow()
        }
    }
    @IBAction func actionShare(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackShare()
        }
    }
    @IBAction func actionShowPathOnGoogleMap(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackShowGoogleMap()
        }
    }

}
extension HomeDetailSliderTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserLogin.foodingAdds.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: ScreenSize.SCREEN_WIDTH, height: 200)
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.HomeSliderCell, for: indexPath) as! HomeSliderCollectionViewCell
        cell.configure(image: UserLogin.foodingAdds[indexPath.row])
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = self.collectionView?.indexPathsForVisibleItems.first{
            self.pageControll?.currentPage = indexPath.item
        }
        
    }
    
    
}
