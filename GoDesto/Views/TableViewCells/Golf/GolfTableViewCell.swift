//
//  GolfTableViewCell.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/28/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class GolfTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblRatingType: UILabel!
    @IBOutlet weak var lblRatingDetails: UILabel!
    @IBOutlet weak var lblShortDescription: UILabel?

    @IBOutlet weak var btnBookNow: UIButton?
    @IBOutlet weak var btnAddToTripPlanner: UIButton?
    @IBOutlet weak var btnRating: UIButton!
    @IBOutlet weak var btnFavourit: UIButton!
    
    @IBOutlet weak var imgReview: UIImageView?
    @IBOutlet weak var imgFavourite: UIImageView?
    @IBOutlet weak var imgLocation: UIImageView?
    
    @IBOutlet weak var imgHoles: UIImageView!
    @IBOutlet weak var imgGolfer: UIImageView!
    @IBOutlet weak var imgRange: UIImageView!
    @IBOutlet weak var imgBermuta: UIImageView!
    @IBOutlet weak var imgDessert: UIImageView!
    
    @IBOutlet weak var facilitiesView: UIView!
    
    var golfItem: GolfCourseListingViewModel?
    var index:Int = 0
    
    override func awakeFromNib() {

        super.awakeFromNib()
        
        self.btnBookNow?.layer.cornerRadius = 5
        self.btnAddToTripPlanner?.layer.cornerRadius = 5
        self.btnRating.layer.cornerRadius = self.btnRating.frame.size.width/2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func didTapFavouritButton(_ sender: UIButton) {
        
        self.btnFavourit.isSelected = !self.btnFavourit.isSelected
        
        var favouriteList = [String]()
        if let list = UserDefaults.standard.value(forKey: UserDefaultKeys.FavouriteGolf) as? [String] {
            favouriteList = list
        }
        if(self.golfItem?.isFavourite)! {
            self.golfItem?.isFavourite  = false
            if let index = favouriteList.index(of:(self.golfItem?.gId)!) {
                favouriteList.remove(at: index)
            }
        }else{
            self.golfItem?.isFavourite = true
            favouriteList.append((self.golfItem?.gId)!)
        }
        UserDefaults.standard.set(favouriteList, forKey: UserDefaultKeys.Favourite)
        UserDefaults.standard.synchronize()
        
    }
    func configureCell(golfItem: GolfCourseListingViewModel, index: Int) {
     
        self.golfItem = golfItem;
        self.index = index
        
        lblName.text = golfItem.name
        lblAddress.text = golfItem.address
        lblShortDescription?.text = golfItem.shortDescription
        imgLogo.sd_setImage(with: URL(string: URL_GOLFLISTING_IMAGES+golfItem.coverPhoto))
        lblRatingType.text = golfItem.ratingText
        btnRating.setTitle(golfItem.rating, for: UIControlState.normal)
        btnFavourit.isSelected = self.golfItem!.isFavourite
        
        var index:Int = 0
        
        for hubs in golfItem.hubImagesArray {
        
            switch index {
                case 0:
                    imgHoles.sd_setImage(with: URL(string: URL_GOLFLISTING_IMAGES+hubs))
                case 1:
                    imgGolfer.sd_setImage(with: URL(string: URL_GOLFLISTING_IMAGES+hubs))
                case 2:
                    imgRange.sd_setImage(with: URL(string: URL_GOLFLISTING_IMAGES+hubs))
                case 3:
                    imgBermuta.sd_setImage(with: URL(string: URL_GOLFLISTING_IMAGES+hubs))
                case 4:
                    imgDessert.sd_setImage(with: URL(string: URL_GOLFLISTING_IMAGES+hubs))
            default:
                print("Nothing to show more")
            }
            
            index = index+1
        }
    }
    
    // will do later. 13.4.18
    // Create scrollview and add images in it. set content size 
    fileprivate func addFicilities(icon: NSString, text:NSString) {
        
        
    }
}

