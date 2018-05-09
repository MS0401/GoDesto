//
//  GolfListingViewModel.swift
//  GoDesto
//
//  Created by Muhammad Rashid on 09/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class GolfCourseListingViewModel {
    
    var gId:String;
    var name:String;
    var rating:String;
    var ratingText:String;
    var courseType:String;
    var grassType:String;
    var holes:String;
    var bookingEmailAddress:String;
    var address:String;
    var images:String;
    var coverPhoto:String;
    var city:String;
    var type:String;
    var price:String;
    var videos:String;
    var country:String;
    var category:String;
    var kind:String;
    var url:String;
    var categoryurl:String;
    var packType:String;
    var subPackTypeUrl:String;
    var packTypeUrl:String;
    var subPackType:String;
    var nights:String;
    var isLive:String;
    var coverBigPhoto:String;
    var tos:String;
    var pdf:String;
    var connectedWhatson:String;
    var viewOrder:String;
    var hubImages:String;
    var hubImagesArray:[String];
    var hubMaps:String;
    var cuisine:String;
    var phoneNumber:String;
    var liveEnter:String;
    var music:String;
    var serveAlcohol:String;
    var brunches:String;
    var happyHour:String;
    var ladiesNite:String;
    var childrenWelcome:String;
    var menuUpload:String;
    var acceptVoucher:String;
    var majorType:String;
    var contactName:String;
    var area:String;
    var wheelchairAcc:String;
    var valParking:String;
    var parking:String;
    var outdoorSeating:String;
    var wifi:String;
    var sheesha:String;
    var dressCode:String;
    var ageRestrict:String;
    var heightRestrict:String;
    var takeAway:String;
    var shortDescription:String;
    var openNow:String;
    var golfList:[GolfCourseList]
    var isFavourite = false
    
    init() {
        self.gId = ""
        self.name = ""
        self.rating = ""
        self.ratingText = ""
        self.courseType = ""
        self.grassType = ""
        self.holes = ""
        self.bookingEmailAddress = ""
        self.address = ""
        self.images = ""
        self.coverPhoto = ""
        self.city = ""
        self.type = ""
        self.price = ""
        self.videos = ""
        self.country = ""
        self.category = ""
        self.kind = ""
        self.url = ""
        self.categoryurl = ""
        self.packType = ""
        self.subPackTypeUrl = ""
        self.packTypeUrl = ""
        self.subPackType = ""
        self.nights = ""
        self.isLive = ""
        self.coverBigPhoto = ""
        self.tos = ""
        self.pdf = ""
        self.connectedWhatson = ""
        self.viewOrder = ""
        self.hubImages = ""
        self.hubImagesArray = [String]()
        self.hubMaps = ""
        self.cuisine = ""
        self.phoneNumber = ""
        self.liveEnter = ""
        self.music = ""
        self.serveAlcohol = ""
        self.brunches = ""
        self.happyHour = ""
        self.ladiesNite = ""
        self.childrenWelcome = ""
        self.menuUpload = ""
        self.acceptVoucher = ""
        self.majorType = ""
        self.contactName = ""
        self.area = ""
        self.wheelchairAcc = ""
        self.valParking = ""
        self.parking = ""
        self.outdoorSeating = ""
        self.wifi = ""
        self.sheesha = ""
        self.dressCode = ""
        self.ageRestrict = ""
        self.heightRestrict = ""
        self.takeAway = ""
        self.shortDescription = ""
        self.openNow = ""
        self.golfList = [GolfCourseList]()
        self.isFavourite = false
    }
    
    convenience init(golf: GolfCourseList) {
        self.init()
        
        self.gId = golf.gId ?? ""
        self.name = golf.name ?? ""
        self.rating = golf.rating ?? ""
        self.ratingText = golf.ratingText ?? ""
        self.courseType = golf.courseType ?? ""
        self.grassType = golf.grassType ?? ""
        self.holes = golf.holes ?? ""
        self.bookingEmailAddress = golf.bookingEmailAddress ?? ""
        self.address = golf.address ?? ""
        self.images = golf.images ?? ""
        self.coverPhoto = golf.coverPhoto ?? ""
        self.city = golf.city ?? ""
        self.type = golf.type ?? ""
        self.price = golf.price ?? ""
        self.videos = golf.videos ?? ""
        self.country = golf.country ?? ""
        self.category = golf.category ?? ""
        self.kind = golf.kind ?? ""
        self.url = golf.url ?? ""
        self.categoryurl = golf.categoryurl ?? ""
        self.packType = golf.packType ?? ""
        self.subPackTypeUrl = golf.subPackTypeUrl ?? ""
        self.packTypeUrl = golf.packTypeUrl ?? ""
        self.subPackType = golf.subPackType ?? ""
        self.nights = golf.nights ?? ""
        self.isLive = golf.isLive ?? ""
        self.coverBigPhoto = golf.coverBigPhoto ?? ""
        self.tos = golf.tos ?? ""
        self.pdf = golf.pdf ?? ""
        self.connectedWhatson = golf.connectedWhatson ?? ""
        self.viewOrder = golf.viewOrder ?? ""
        self.hubImages = golf.hubImages ?? ""
        self.hubImagesArray = self.hubImages.components(separatedBy: "##")
        self.hubMaps = golf.hubMaps ?? ""
        self.cuisine = golf.cuisine ?? ""
        self.phoneNumber = golf.phoneNumber ?? ""
        self.liveEnter = golf.liveEnter ?? ""
        self.music = golf.music ?? ""
        self.serveAlcohol = golf.serveAlcohol ?? ""
        self.brunches = golf.brunches ?? ""
        self.happyHour = golf.happyHour ?? ""
        self.ladiesNite = golf.ladiesNite ?? ""
        self.childrenWelcome = golf.childrenWelcome ?? ""
        self.menuUpload = golf.menuUpload ?? ""
        self.acceptVoucher = golf.acceptVoucher ?? ""
        self.majorType = golf.majorType ?? ""
        self.contactName = golf.contactName ?? ""
        self.area = golf.area ?? ""
        self.wheelchairAcc = golf.wheelchairAcc ?? ""
        self.valParking = golf.valParking ?? ""
        self.parking = golf.parking ?? ""
        self.outdoorSeating = golf.outdoorSeating ?? ""
        self.wifi = golf.wifi ?? ""
        self.sheesha = golf.sheesha ?? ""
        self.dressCode = golf.dressCode ?? ""
        self.ageRestrict = golf.ageRestrict ?? ""
        self.heightRestrict = golf.heightRestrict ?? ""
        self.takeAway = golf.takeAway ?? ""
        self.shortDescription = golf.shortDescription ?? ""
        self.openNow = golf.openNow ?? ""
        self.isFavourite = false
        
        var favouriteList = [String]()
        if let list = UserDefaults.standard.value(forKey: UserDefaultKeys.FavouriteGolf) as? [String]{
            favouriteList = list
        }
        if(favouriteList.count  > 0){
            for item in favouriteList{
                if(item == self.gId){
                    self.isFavourite = true
                }
            }
        }
    }
    
    func addMoreHotels(list:[GolfCourseList])  {
        self.golfList.append(contentsOf: list)
    }
}
