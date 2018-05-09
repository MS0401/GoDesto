//
//  HomeInfoViewModel.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 4/8/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class HomeInfoViewModel {
    
    var id:String
    var name:String
    var bookingEmailAddress:String
    var designer:String
    var grassType:String
    var courseType:String
    var holes:String
    var establishedIn:String
    var courseLength:String
    var par:String
    var bodyCopy:String
    var address:String
    var images:String
    var coverPhoto:String
    var city:String
    var type:String
    var price:String
    var videos:String
    var country:String
    var category:String
    var kind:String
    var url:String
    var categoryurl:String
    var packType:String
    var subPackTypeUrl:String
    var subPackType:String
    var nights:String
    var isLive:String
    var coverBigPhoto:String
    var tos:String
    var pdf:String
    var connectedWhatson:String
    var viewOrder:String
    var hubImages:String
    var hubMaps:String
    var hubOptions:String
    var hubSpOffers:String
    var hubPdfs:String
    var commision:String
    var video:String
    var holes9From:String
    var holes9To:String
    var holes18From:String
    var holes18To:String
    var cuisine:String
    var phoneNumber:String
    var liveEnter:String
    var music:String
    var serveAlcohol:String
    var brunches:String
    var happyHour:String
    var ladiesNite:String
    var childrenWelcome:String
    var menuUpload:String
    var acceptVoucher:String
    var majorType:String
    var contactName:String
    var area:String
    var wheelchairAcc:String
    var valParking:String
    var parking:String
    var outdoorSeating:String
    var wifi:String
    var sheesha:String
    var dressCode:String
    var ageRestrict:String
    var heightRestrict:String
    var takeAway:String
    var mName:String
    var mNumber:String
    var mEmail:String
    var mStatus:String
    var adminBy:String
    var shortDescription:String
    var openNow:String
    var distanceFromUser:String
    var spa:String
    var indoor:String
    var outdoor:String
    var zomatoLink:String
    var bars:String
    var votes:String
    var rating:String
    var address2:String
    var lat:String
    var lng:String
    var placeId:String
    var name2:String
    var ratingText:String
    var isFavourite:Bool
    
    init() {
        
        self.id = ""
        self.name = ""
        self.bookingEmailAddress = ""
        self.designer = ""
        self.grassType = ""
        self.courseType = ""
        self.holes = ""
        self.establishedIn = ""
        self.courseLength = ""
        self.par = ""
        self.bodyCopy = ""
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
        self.subPackType = ""
        self.nights = ""
        self.isLive = ""
        self.coverBigPhoto = ""
        self.tos = ""
        self.pdf = ""
        self.connectedWhatson = ""
        self.viewOrder = ""
        self.hubImages = ""
        self.hubMaps = ""
        self.hubOptions = ""
        self.hubSpOffers = ""
        self.hubPdfs = ""
        self.commision = ""
        self.video = ""
        self.holes9From = ""
        self.holes9To = ""
        self.holes18From = ""
        self.holes18To = ""
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
        self.mName = ""
        self.mNumber = ""
        self.mEmail = ""
        self.mStatus = ""
        self.adminBy = ""
        self.shortDescription = ""
        self.openNow = ""
        self.distanceFromUser = ""
        self.spa = ""
        self.indoor = ""
        self.outdoor = ""
        self.zomatoLink = ""
        self.bars = ""
        self.votes = ""
        self.rating = ""
        self.address2 = ""
        self.lat = ""
        self.lng = ""
        self.placeId = ""
        self.name2 = ""
        self.ratingText = ""
        self.isFavourite = false
    }
    
    init(homeModel:HomeInfo) {
        
        self.id = homeModel.hotelId ?? ""
        self.name = homeModel.name ?? ""
        self.bookingEmailAddress = homeModel.bookingEmailAddress ?? ""
        self.designer = homeModel.designer ?? ""
        self.grassType = homeModel.grassType ?? ""
        self.courseType = homeModel.courseType ?? ""
        self.holes = homeModel.holes ?? ""
        self.establishedIn = homeModel.establishedIn ?? ""
        self.courseLength = homeModel.courseLength ?? ""
        self.par = homeModel.par ?? ""
        self.bodyCopy = homeModel.bodyCopy ?? ""
        self.address = homeModel.address ?? ""
        self.images = homeModel.images ?? ""
        self.coverPhoto = homeModel.coverPhoto ?? ""
        self.city = homeModel.city ?? ""
        self.type = homeModel.type ?? ""
        self.price = homeModel.price ?? ""
        self.videos = homeModel.videos ?? ""
        self.country = homeModel.country ?? ""
        self.category = homeModel.category ?? ""
        self.kind = homeModel.kind ?? ""
        self.url = homeModel.url ?? ""
        self.categoryurl = homeModel.categoryurl ?? ""
        self.packType = homeModel.packType ?? ""
        self.subPackTypeUrl = homeModel.subPackTypeUrl ?? ""
        self.subPackType = homeModel.subPackType ?? ""
        self.nights = homeModel.nights ?? ""
        self.isLive = homeModel.isLive ?? ""
        self.coverBigPhoto = homeModel.coverBigPhoto ?? ""
        self.tos = homeModel.tos ?? ""
        self.pdf = homeModel.pdf ?? ""
        self.connectedWhatson = homeModel.connectedWhatson ?? ""
        self.viewOrder = homeModel.viewOrder ?? ""
        self.hubImages = homeModel.hubImages ?? ""
        self.hubMaps = homeModel.hubMaps ?? ""
        self.hubOptions = homeModel.hubOptions ?? ""
        self.hubSpOffers = homeModel.hubSpOffers ?? ""
        self.hubPdfs = homeModel.hubPdfs ?? ""
        self.commision = homeModel.commision ?? ""
        self.video = homeModel.video ?? ""
        self.holes9From = homeModel.holes9From ?? ""
        self.holes9To = homeModel.holes9To ?? ""
        self.holes18From = homeModel.holes18From ?? ""
        self.holes18To = homeModel.holes18To ?? ""
        self.cuisine = homeModel.cuisine ?? ""
        self.phoneNumber = homeModel.phoneNumber ?? ""
        self.liveEnter = homeModel.liveEnter ?? ""
        self.music = homeModel.music ?? ""
        self.serveAlcohol = homeModel.serveAlcohol ?? ""
        self.brunches = homeModel.brunches ?? ""
        self.happyHour = homeModel.happyHour ?? ""
        self.ladiesNite = homeModel.ladiesNite ?? ""
        self.childrenWelcome = homeModel.childrenWelcome ?? ""
        self.menuUpload = homeModel.menuUpload ?? ""
        self.acceptVoucher = homeModel.acceptVoucher ?? ""
        self.majorType = homeModel.majorType ?? ""
        self.contactName = homeModel.contactName ?? ""
        self.area = homeModel.area ?? ""
        self.wheelchairAcc = homeModel.wheelchairAcc ?? ""
        self.valParking = homeModel.valParking ?? ""
        self.parking = homeModel.parking ?? ""
        self.outdoorSeating = homeModel.outdoorSeating ?? ""
        self.wifi = homeModel.wifi ?? ""
        self.sheesha = homeModel.sheesha ?? ""
        self.dressCode = homeModel.dressCode ?? ""
        self.ageRestrict = homeModel.ageRestrict ?? ""
        self.heightRestrict = homeModel.heightRestrict ?? ""
        self.takeAway = homeModel.takeAway ?? ""
        self.mName = homeModel.mName ?? ""
        self.mNumber = homeModel.mNumber ?? ""
        self.mEmail = homeModel.mEmail ?? ""
        self.mStatus = homeModel.mStatus ?? ""
        self.adminBy = homeModel.adminBy ?? ""
        self.shortDescription = homeModel.shortDescription ?? ""
        self.openNow = homeModel.openNow ?? ""
        self.distanceFromUser = homeModel.distanceFromUser ?? ""
        self.spa = homeModel.spa ?? ""
        self.indoor = homeModel.indoor ?? ""
        self.outdoor = homeModel.outdoor ?? ""
        self.zomatoLink = homeModel.zomatoLink ?? ""
        self.bars = homeModel.bars ?? ""
        self.votes = homeModel.votes ?? ""
        self.rating = homeModel.rating ?? ""
        self.address2 = homeModel.address2 ?? ""
        self.lat = homeModel.lat ?? ""
        self.lng = homeModel.lng ?? ""
        self.placeId = homeModel.placeId ?? ""
        self.name2 = homeModel.name2 ?? ""
        self.ratingText = homeModel.ratingText ?? ""
        self.isFavourite = false
        
        let token = self.hubMaps.components(separatedBy: "__")
        if(token.count > 3){
            self.lng = token[3]
            self.lat = token[2]
        }
        var favouriteList = [String]()
        if let list = UserDefaults.standard.value(forKey: UserDefaultKeys.ThingToDoFavourite) as? [String]{
            favouriteList = list
        }
        if(favouriteList.count  > 0){
            for item in favouriteList{
                if(item == self.id){
                    self.isFavourite = true
                }
            }
        }
    }
}
