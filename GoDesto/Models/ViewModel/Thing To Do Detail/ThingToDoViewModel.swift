//  ThingToDoViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class ThingToDoViewModel {
    var id: String
   var  name: String
    var bookingEmailAddress: String
    var designer: String
    var grassType: String
    var courseType: String
   var  holes: String
   var  establishedIn: String
   var  courseLength: String
   var  par: String
   var  bodyCopy: String
   var  address: String
   var  images: String
   var  coverPhoto: String
   var  city: String
   var  type: String
   var  price: String
   var  videos: String
   var  country: String
   var  category: String
   var  kind: String
   var  url: String
   var  categoryurl: String
   var  packType: String
   var  subPackTypeUrl: String
   var  packTypeUrl: String
   var  subPackType: String
   var  nights: String
    var live: String
   var  coverBigPhoto: String
   var  tos: String
   var  pdf: String
   var  connectedWhatson: String
   var  viewOrder: String
   var  hubImages: String
   var  hubMaps: String
   var  hubOptions: String
    var hubSpOffers: String
    var hubPdfs: String
    var commision: String
    var video: String
    var holes9From: String
    var holes9To: String
   var  holes18From: String
   var  holes18To: String
   var  cuisine: String
   var  phoneNumber: String
   var  liveEnter: String
    var music: String
    var serveAlcohol: String
    var brunches: String
    var happyHour: String
    var ladiesNite: String
   var  childrenWelcome: String
   var  menuUpload: String
   var  acceptVoucher: String
    var majorType: String
    var contactName: String
    var area: String
    var wheelchairAcc: String
    var valParking: String
    var parking: String
    var outdoorSeating: String
    var wifi: String
    var sheesha: String
    var dressCode: String
    var ageRestrict: String
    var heightRestrict: String
    var takeAway: String
    var mName: String
    var mNumber: String
    var mEmail: String
    var mStatus: String
    var adminBy: String
    var shortDescription: String
    var openNow: String
    var distanceFromUser: String
    var spa: String
    var indoor: String
    var outdoor: String
   var  z: String
   var  bars: String
   var  votes: String
    var rating: String
    var address2: String
    var lat: String
    var lng: String
    var placeId: String
    var name2: String
    var ratingText: String
    
    var imageList:[String]
    var menuImageList:[String]
    var completeDetail:DescriptionViewModel
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
        self.packTypeUrl = ""
        self.subPackType = ""
        self.nights = ""
        self.live = ""
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
        self.z = ""
        self.bars = ""
        self.votes = ""
        self.rating = ""
        self.address2 = ""
        self.lat = ""
        self.lng = ""
        self.placeId = ""
        self.name2 = ""
        self.ratingText = ""
        self.imageList = [String]()
        self.menuImageList = [String]()
        self.completeDetail = DescriptionViewModel()
        self.isFavourite = false
    }
    
    
    convenience init(dic:NSDictionary) {
        self.init()
        
        self.id = dic.object(forKey: "id") as? String ?? ""
        self.name = dic.object(forKey: "name") as? String ?? ""
        self.bookingEmailAddress = dic.object(forKey: "booking_email_address") as? String ?? ""
        self.designer = dic.object(forKey: "designer") as? String ?? ""
        self.grassType = dic.object(forKey: "grass_type") as? String ?? ""
        self.courseType = dic.object(forKey: "course_type") as? String ?? ""
        self.holes = dic.object(forKey: "holes") as? String ?? ""
        self.establishedIn = dic.object(forKey: "established_in") as? String ?? ""
        self.courseLength = dic.object(forKey: "course_length") as? String ?? ""
        self.par = dic.object(forKey: "par") as? String ?? ""
        self.bodyCopy = dic.object(forKey: "body_copy") as? String ?? ""
        self.address = dic.object(forKey: "address") as? String ?? ""
        self.images = dic.object(forKey: "images") as? String ?? ""
        self.coverPhoto = dic.object(forKey: "cover_photo") as? String ?? ""
        self.city = dic.object(forKey: "city") as? String ?? ""
        self.type = dic.object(forKey: "type") as? String ?? ""
        self.price = dic.object(forKey: "price") as? String ?? ""
        self.videos = dic.object(forKey: "videos") as? String ?? ""
        self.country = dic.object(forKey: "country") as? String ?? ""
        self.category = dic.object(forKey: "category") as? String ?? ""
        self.kind = dic.object(forKey: "kind") as? String ?? ""
        self.url = dic.object(forKey: "url") as? String ?? ""
        self.categoryurl = dic.object(forKey: "categoryurl") as? String ?? ""
        self.packType = dic.object(forKey: "pack_type") as? String ?? ""
        self.subPackTypeUrl = dic.object(forKey: "sub_pack_type_url") as? String ?? ""
        self.packTypeUrl = dic.object(forKey: "pack_type_url") as? String ?? ""
        self.subPackType = dic.object(forKey: "sub_pack_type") as? String ?? ""
        self.nights = dic.object(forKey: "nights") as? String ?? ""
        self.live = dic.object(forKey: "is_live") as? String ?? ""
        self.coverBigPhoto = dic.object(forKey: "cover_big_photo") as? String ?? ""
        self.tos = dic.object(forKey: "tos") as? String ?? ""
        self.pdf = dic.object(forKey: "pdf") as? String ?? ""
        self.connectedWhatson = dic.object(forKey: "connected_whatson") as? String ?? ""
        self.viewOrder = dic.object(forKey: "view_order") as? String ?? ""
        self.hubImages = dic.object(forKey: "hub_images") as? String ?? ""
        self.hubMaps = dic.object(forKey: "hub_maps") as? String ?? ""
        self.hubOptions = dic.object(forKey: "hub_options") as? String ?? ""
        self.hubSpOffers  = dic.object(forKey: "hub_sp_offers") as? String ?? ""
        self.hubPdfs  = dic.object(forKey: "hub_pdfs") as? String ?? ""
        self.commision  = dic.object(forKey: "commision") as? String ?? ""
        self.video  = dic.object(forKey: "video") as? String ?? ""
        self.holes9From  = dic.object(forKey: "holes_9_from") as? String ?? ""
        self.holes9To  = dic.object(forKey: "holes_9_to") as? String ?? ""
        self.holes18From  = dic.object(forKey: "holes_18_from") as? String ?? ""
        self.holes18To  = dic.object(forKey: "holes_18_to") as? String ?? ""
        self.cuisine  = dic.object(forKey: "cuisine") as? String ?? ""
        self.phoneNumber  = dic.object(forKey: "phone_number") as? String ?? ""
        self.liveEnter  = dic.object(forKey: "live_enter") as? String ?? ""
        self.music  = dic.object(forKey: "music") as? String ?? ""
        self.serveAlcohol  = dic.object(forKey: "serve_alcohol") as? String ?? ""
        self.brunches  = dic.object(forKey: "brunches") as? String ?? ""
        self.happyHour  = dic.object(forKey: "happy_hour") as? String ?? ""
        self.ladiesNite  = dic.object(forKey: "ladies_nite") as? String ?? ""
        self.childrenWelcome  = dic.object(forKey: "children_welcome") as? String ?? ""
        self.menuUpload  = dic.object(forKey: "menu_upload") as? String ?? ""
        self.acceptVoucher  = dic.object(forKey: "accept_voucher") as? String ?? ""
        self.majorType  = dic.object(forKey: "major_type") as? String ?? ""
        self.contactName  = dic.object(forKey: "contact_name") as? String ?? ""
        self.area  = dic.object(forKey: "area") as? String ?? ""
        self.wheelchairAcc  = dic.object(forKey: "wheelchair_acc") as? String ?? ""
        self.valParking  = dic.object(forKey: "val_parking") as? String ?? ""
        self.parking  = dic.object(forKey: "parking") as? String ?? ""
        self.outdoorSeating  = dic.object(forKey: "outdoor_seating") as? String ?? ""
        self.wifi  = dic.object(forKey: "wifi") as? String ?? ""
        self.sheesha  = dic.object(forKey: "sheesha") as? String ?? ""
        self.dressCode  = dic.object(forKey: "dress_code") as? String ?? ""
        self.ageRestrict  = dic.object(forKey: "age_restrict") as? String ?? ""
        self.heightRestrict  = dic.object(forKey: "height_restrict") as? String ?? ""
        self.takeAway  = dic.object(forKey: "take_away") as? String ?? ""
        self.mName  = dic.object(forKey: "m_name") as? String ?? ""
        self.mNumber  = dic.object(forKey: "m_number") as? String ?? ""
        self.mEmail  = dic.object(forKey: "m_email") as? String ?? ""
        self.mStatus  = dic.object(forKey: "m_status") as? String ?? ""
        self.adminBy  = dic.object(forKey: "admin_by") as? String ?? ""
        self.shortDescription  = dic.object(forKey: "short_description") as? String ?? ""
        self.openNow  = dic.object(forKey: "open_now") as? String ?? ""
        self.distanceFromUser  = dic.object(forKey: "distance_from_user") as? String ?? ""
        self.spa  = dic.object(forKey: "spa") as? String ?? ""
        self.indoor  = dic.object(forKey: "indoor") as? String ?? ""
        self.outdoor  = dic.object(forKey: "outdoor") as? String ?? ""
        self.z  = dic.object(forKey: "z") as? String ?? ""
        self.bars  = dic.object(forKey: "bars") as? String ?? ""
        self.votes  = dic.object(forKey: "votes") as? String ?? ""
        self.rating  = dic.object(forKey: "rating") as? String ?? ""
        self.address2  = dic.object(forKey: "address2") as? String ?? ""
        self.lat  = dic.object(forKey: "lat") as? String ?? ""
        self.lng  = dic.object(forKey: "lng") as? String ?? ""
        self.placeId  = dic.object(forKey: "place_id") as? String ?? ""
        self.name2  = dic.object(forKey: "name_2") as? String ?? ""
        self.ratingText  = dic.object(forKey: "rating_text") as? String ?? ""
        self.imageList = [String]()
        let hotalImages = self.hubImages.components(separatedBy: "##")
        
        for item in hotalImages{
            if(!item.isEmpty){
                self.imageList.append(item)
            }
            
        }
        let menuImages = self.menuUpload.components(separatedBy: "##")
        
        for item in menuImages{
            if(!item.isEmpty){
                self.menuImageList.append(item)
            }
            
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
        self.completeDetail = DescriptionViewModel(text: self.bodyCopy)
    }
}
