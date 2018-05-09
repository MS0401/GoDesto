//
//  ThingsToDoDetailSliderTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol ThingsToDoDetailSliderDelegate:NSObjectProtocol {
    func actionCallBackShareText(url:String)
    func didTapBookingBtn()
}
class ThingsToDoDetailSliderTableViewCell:BaseTableViewCell {

   
    @IBOutlet weak var collectionViewTopSpace:NSLayoutConstraint?
    @IBOutlet weak var collectionViewBottomSpace:NSLayoutConstraint?
    
    @IBOutlet weak var collectionView:UICollectionView?
        @IBOutlet weak var lblTitle:UILabel?
        @IBOutlet weak var lblSubtitle:UILabel?
    @IBOutlet weak var pageControll:UIPageControl?
    @IBOutlet weak var imgFavrouit:UIImageView?
    @IBOutlet weak var btnRating:UIButton?
    
    
    var images:[String]?
    var detail:ThingToDoViewModel?
    var delegate:ThingsToDoDetailSliderDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.collectionView?.register(UINib(nibName: NIBName.HomeSliderCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.HomeSliderCell)
        print(UserLogin.foodingAdds.count)
        self.pageControll?.isUserInteractionEnabled = false
      
        //self.pageControll?.numberOfPages = Home.HomeAdds.count
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func confgureView(detail:ThingToDoViewModel)  {
        self.detail = detail
        self.lblTitle?.text = detail.name
        self.lblSubtitle?.text = detail.address
        self.images = detail.imageList
        self.pageControll?.numberOfPages = self.images!.count
        self.btnRating?.setTitle(detail.rating, for: .normal)
        self.collectionView?.reloadData()
        if(detail.isFavourite){
            self.imgFavrouit?.image =  UIImage(named:"selected-heart")
        }else{
            self.imgFavrouit?.image =  UIImage(named:"white-heart")
        }
        self.btnRating?.layer.cornerRadius = 10
        self.btnRating?.clipsToBounds = true
    }
    
    @IBAction func actionFavrouite(_ sender:UIButton){
        
        var favouriteList = [String]()
        if let list = UserDefaults.standard.value(forKey: UserDefaultKeys.ThingToDoFavourite) as? [String]{
            favouriteList = list
        }
       
        if(self.detail!.isFavourite){
            self.detail!.isFavourite = false
            if let index = favouriteList.index(of:self.detail!.id) {
                favouriteList.remove(at: index)
            }
        }else{
           self.detail!.isFavourite = true
            favouriteList.append(self.detail!.id)
        }
        UserDefaults.standard.set(favouriteList, forKey: UserDefaultKeys.ThingToDoFavourite)
        UserDefaults.standard.synchronize()
        
        self.confgureView(detail: self.detail!)
    }
    @IBAction func actionShare(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackShareText(url: BASE_SHARE_THINGS_TO_DO_URL + self.detail!.url)
        }
    }
    @IBAction func actionNext(_ sender:UIButton){
        
    }
    
    @IBAction func didTapBook(_ sender:UIButton){
        
        if let del = self.delegate{
            del.didTapBookingBtn()
        }        
    }
  
    
}
extension ThingsToDoDetailSliderTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let _ = self.images{
            return 1
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images!.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.size.width, height: self.collectionView!.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.HomeSliderCell, for: indexPath) as! HomeSliderCollectionViewCell
        //cell.configure(image: Home.HomeAdds[indexPath.row])
        cell.configureImage(image: self.images![indexPath.row])
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = self.collectionView?.indexPathsForVisibleItems.first{
            self.pageControll?.currentPage = indexPath.item
        }
        
    }
    
}

