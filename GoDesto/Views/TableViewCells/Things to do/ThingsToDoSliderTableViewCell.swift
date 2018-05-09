//
//  ThingsToDoSliderTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ThingsToDoSliderTableViewCell: BaseTableViewCell {

    
    @IBOutlet weak var collectionViewTopSpace:NSLayoutConstraint?
    @IBOutlet weak var collectionViewBottomSpace:NSLayoutConstraint?
    
    @IBOutlet weak var collectionView:UICollectionView?
    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var lblSubtitle:UILabel?
    @IBOutlet weak var pageControll:UIPageControl?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.collectionView?.register(UINib(nibName: NIBName.HomeSliderCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.HomeSliderCell)
        print(UserLogin.foodingAdds.count)
        self.pageControll?.numberOfPages = Home.HomeAdds.count
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func actionNext(_ sender:UIButton){
        
    }
  
    
}
extension ThingsToDoSliderTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Home.HomeAdds.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.size.width, height: self.collectionView!.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.HomeSliderCell, for: indexPath) as! HomeSliderCollectionViewCell
        //cell.configure(image: Home.HomeAdds[indexPath.row])
        cell.configureView(image: Home.HomeAdds[indexPath.row])
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = self.collectionView?.indexPathsForVisibleItems.first{
            self.pageControll?.currentPage = indexPath.item
        }
        
    }
    
}
