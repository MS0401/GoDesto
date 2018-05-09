//
//  ThingToDoListingTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 19/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol ThingToDoListingTDelegate:NSObjectProtocol {
    func actionCallBackShowDetail(thing:HomeInfoViewModel)
}
class ThingToDoListingTableViewCell: BaseTableViewCell {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblRatingCount: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblRatingText: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    
    @IBOutlet weak var btnView: UIButton!
    @IBOutlet weak var btnBook: UIButton!
    @IBOutlet weak var btnAddToTrip: UIButton!
   
    @IBOutlet weak var imgFavourite: UIImageView!
    @IBOutlet weak var imgRating: UIImageView!
   
    @IBOutlet weak var imgGlass: UIImageView!
    @IBOutlet weak var imgPercentage: UIImageView!
    @IBOutlet weak var imgMike: UIImageView!
    @IBOutlet weak var imgFamily: UIImageView!
    @IBOutlet weak var imgTwoGlass: UIImageView!
    @IBOutlet weak var imgLady: UIImageView!
    @IBOutlet weak var imgChair: UIImageView!

    var thingTodo:HomeInfoViewModel?
    var delegate:ThingToDoListingTDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        self.btnBook.layer.cornerRadius = 15
//        self.btnView.layer.cornerRadius = 15
//        self.btnAddToTrip.layer.cornerRadius = 15
        
        self.lblDistance.layer.cornerRadius = 1
        self.lblDistance.layer.borderWidth = 1
        self.lblDistance.layer.borderColor = DARK_RED_COLOR.cgColor
        self.imgRating.layer.cornerRadius = 5
        
        
        
    }
    
    
    func configureView(thing:HomeInfoViewModel) {
        self.thingTodo = thing
        self.lblName.text = thing.name
        self.lblDetail.text = thing.address
        self.lblRatingCount.text = thing.rating
        self.lblRating.text = thing.ratingText
        self.setImageWithUrl(imageView: self.imgLogo, url: BASE_PHOTO_URL + thing.coverPhoto)
        
        if(thing.serveAlcohol == "1"){
            self.imgGlass.isHidden = false
        }else{
            self.imgGlass.isHidden = true
        }
        if(thing.acceptVoucher == "1"){
            self.imgPercentage.isHidden = false
        }else{
            self.imgPercentage.isHidden = true
        }
        if(thing.ladiesNite == "1"){
            self.imgLady.isHidden = false
        }else{
            self.imgLady.isHidden = true
        }
        if(thing.childrenWelcome == "1"){
            self.imgFamily.isHidden = false
        }else{
            self.imgFamily.isHidden = true
        }
        if(thing.liveEnter == "1"){
            self.imgMike.isHidden = false
        }else{
            self.imgMike.isHidden = true
        }
        if(thing.outdoorSeating == "1"){
            self.imgChair.isHidden = false
        }else{
            self.imgChair.isHidden = true
        }
        if(thing.happyHour == "1"){
            self.imgTwoGlass.isHidden = false
        }else{
            self.imgTwoGlass.isHidden = true
        }
        
        if(thing.isFavourite){
            self.imgFavourite.image = UIImage(named:"selected-heart")
        }else{
            self.imgFavourite.image = UIImage(named:"heart")
            
        }
        
    }

    @IBAction func actionFaverouite(_ sender:UIButton){
        var favouriteList = [String]()
        if let list = UserDefaults.standard.value(forKey: UserDefaultKeys.ThingToDoFavourite) as? [String]{
            favouriteList = list
        }
        if(self.thingTodo!.isFavourite){
            self.thingTodo!.isFavourite  = false
            self.imgFavourite.image = UIImage(named:"heart")
            if let index = favouriteList.index(of:self.thingTodo!.id) {
                favouriteList.remove(at: index)
            }
        }else{
            self.thingTodo?.isFavourite = true
            self.imgFavourite.image = UIImage(named:"selected-heart")
            favouriteList.append(self.thingTodo!.id)
        }
        UserDefaults.standard.set(favouriteList, forKey: UserDefaultKeys.ThingToDoFavourite)
        UserDefaults.standard.synchronize()
    }
    @IBAction func actionShowDetail(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackShowDetail(thing:self.thingTodo!)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
