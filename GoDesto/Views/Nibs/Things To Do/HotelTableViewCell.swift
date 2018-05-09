//
//  HotelTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 19/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
import Cosmos
class HotelTableViewCell: BaseTableViewCell {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var viewRating: CosmosView!
    @IBOutlet weak var lblBestRate: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnPrice: UIButton!
    
    @IBOutlet weak var lblRoomType: UILabel!
    
    @IBOutlet weak var imgReview: UIImageView!
    @IBOutlet weak var imgFavourite: UIImageView!
    @IBOutlet weak var imgLocation: UIImageView!
    
    @IBOutlet weak var imgSpa: UIImageView!
    @IBOutlet weak var imgWifi: UIImageView!
    @IBOutlet weak var imgTea: UIImageView!
    @IBOutlet weak var imgSwimmingPool: UIImageView!
    @IBOutlet weak var imgUmbrella: UIImageView!
    @IBOutlet weak var lblDiscountPrice: UIButton!
    @IBOutlet weak var lblLine: UILabel!
    
    
    var hotel:HotelViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.btnPrice.layer.cornerRadius = 5
        self.btnPrice.layer.cornerRadius = 5
    }

    class func instanceFromNib() -> HotelTableViewCell {
        return UINib(nibName: "HotelTableViewCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HotelTableViewCell
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func  configure(hotel:HotelViewModel,code:String? = "PKR")  {
        self.hotel = hotel
        self.lblName.text = hotel.name
        self.viewRating.rating = (Double(hotel.rating)!)
        self.lblAddress.text  = hotel.hotelAddress
        self.lblBestRate.text = "Best \(hotel.roomDescription) Rate"
        self.lblRoomType.text = hotel.roomText
        self.setImageWithUrl(imageView: self.imgLogo, url: hotel.mainImage)
        self.btnPrice.setTitle("\(code!) \(hotel.countryPrice)", for: .normal)
       
        if (hotel.amenity.contains("internet") || hotel.amenity.contains("wlan") || hotel.amenity.contains("wifi")) {
            self.imgWifi.isHidden = false
        } else {
            self.imgWifi.isHidden = true
        }
        
        if (hotel.amenity.contains("breakfast")) {
            self.imgTea.isHidden = false
        } else {
            self.imgTea.isHidden = true
        }
        
        
        if (hotel.amenity.contains("pool")) {
            self.imgSwimmingPool.isHidden = false
        } else {
            self.imgSwimmingPool.isHidden = true
        }
        
        
        if (hotel.amenity.contains("spa")) {
           self.imgSpa.isHidden = false
        } else {
            self.imgSpa.isHidden = true
        }
        
        
        if (hotel.amenity.contains("beach")) {
            self.imgUmbrella.isHidden = false
        } else {
            self.imgUmbrella.isHidden = true
        }
        if(self.hotel!.isFavourite){
            self.imgFavourite.image = UIImage(named:"selected-heart")
        }else{
            self.imgFavourite.image = UIImage(named:"heart")
        }
        
        
    }
    @IBAction func actionFaverouite(_ sender:UIButton){
        var favouriteList = [String]()
        if let list = UserDefaults.standard.value(forKey: UserDefaultKeys.Favourite) as? [String]{
            favouriteList = list
        }
        if(self.hotel!.isFavourite){
            self.hotel?.isFavourite  = false
            self.imgFavourite.image = UIImage(named:"heart")
            if let index = favouriteList.index(of:self.hotel!.hotelCode) {
                favouriteList.remove(at: index)
            }
        }else{
            self.hotel?.isFavourite = true
            self.imgFavourite.image = UIImage(named:"selected-heart")
            favouriteList.append(self.hotel!.hotelCode)
        }
        UserDefaults.standard.set(favouriteList, forKey: UserDefaultKeys.Favourite)
        UserDefaults.standard.synchronize()
    }
}
