//
//  DetailViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class DetailViewModel {
    
    var sliderList:[ImageViewModel]
    var menuList:[ImageViewModel]
    var reviewList:[ReviewViewModel]
    var overview:OverviewViewModel
    var faciltiesList:[FacilitiesViewModel]
    var timingList:[OpeningTimesViewModel]
    
    var dicDetail:[String:Any]
    var sectionList:[SectionViewModel]
    var optionList:[FilterOptionViewModel]
    var detailFilterOption:[FilterOptionViewModel]
    
    var hotelDetailOptionList:[FilterOptionViewModel]
    
    var golfSectionList:[SectionViewModel]
    var hotelDetailSectionList:[SectionViewModel]
    
    var thingToDoSection:[SectionViewModel]
    
    
    init() {
        self.sliderList = [ImageViewModel]()
        self.menuList = [ImageViewModel]()
        self.reviewList = [ReviewViewModel]()
        self.overview = OverviewViewModel()
        self.faciltiesList = [FacilitiesViewModel]()
        self.timingList = [OpeningTimesViewModel]()
        self.dicDetail = [String:Any]()
        self.optionList = [FilterOptionViewModel]()
        self.hotelDetailOptionList = [FilterOptionViewModel]()
       
        self.sectionList = [SectionViewModel]()
        self.golfSectionList = [SectionViewModel]()
        self.hotelDetailSectionList = [SectionViewModel]()
        self.detailFilterOption = [FilterOptionViewModel]()
        self.thingToDoSection = [SectionViewModel]()
        
        for i in 0 ..< 4 {
            self.sliderList.append(ImageViewModel(image: "image\(i+1)"))
        }
        for i in 0 ..< 5 {
            self.menuList.append(ImageViewModel(image: "image\(i+1)"))
        }
        for _ in 0 ..< 5 {
            self.reviewList.append(ReviewViewModel())
        }
        for i in 0 ..< 5 {
            self.faciltiesList.append(FacilitiesViewModel(title: "test", image: "image\(i+1)"))
        }
        for _ in 0 ..< 5 {
            self.timingList.append(OpeningTimesViewModel(day: "Monday", time: "10:00 - 12:00"))
        }
        
        self.dicDetail = ["slider":self.sliderList,"Overview":self.overview,"Facilities":self.faciltiesList,"Opening times":self.timingList,"Vouchers & Discounts":self.overview,"4.5 / 5":self.reviewList]
        
        self.sectionList.append(SectionViewModel(title:"slider",isselected:false))
        self.sectionList.append(SectionViewModel(title:"Overview",isselected:false))
        self.sectionList.append(SectionViewModel(title:"Facilities",isselected:false))
        self.sectionList.append(SectionViewModel(title:"Opening times",isselected:false))
        self.sectionList.append(SectionViewModel(title:"Vouchers & Discounts",isselected:false))
        self.sectionList.append(SectionViewModel(title:"4.5 / 5",isselected:false))
        
        self.golfSectionList.append(SectionViewModel(title:"slider",isselected:false))
        self.golfSectionList.append(SectionViewModel(title:"Overview",isselected:false))
        self.golfSectionList.append(SectionViewModel(title:"iconWithTitles",isselected:false))
        self.golfSectionList.append(SectionViewModel(title:"Detail",isselected:false))
        self.golfSectionList.append(SectionViewModel(title:"Map",isselected:false,icon:"map"))
        self.golfSectionList.append(SectionViewModel(title:"Features",isselected:false,icon:"IconBrowser"))
       self.golfSectionList.append(SectionViewModel(title:"Facilities",isselected:false,icon:"IconGolfCart"))
        self.golfSectionList.append(SectionViewModel(title:"Course Fee",isselected:false,icon:"IconMoney"))
        self.golfSectionList.append(SectionViewModel(title:"Vouchers & Discounts",isselected:false,icon:"IconPercentageBlack"))
        
        self.optionList.append(FilterOptionViewModel(image: "golf-hole-flag", name: "18 Holes", title: "18 Holes"))
        self.optionList.append(FilterOptionViewModel(image: "", name: "72", title: "Par"))
        self.optionList.append(FilterOptionViewModel(image: "golf-putter", name: "Range", title: "Range"))
        self.optionList.append(FilterOptionViewModel(image: "", name: "7658", title: "Yards"))
        self.optionList.append(FilterOptionViewModel(image: "grass-leaves", name: "Bermuta", title: "Bermuta"))
        
        self.hotelDetailSectionList.append(SectionViewModel(title:"slider",isselected:false))
        self.hotelDetailSectionList.append(SectionViewModel(title:"Overview",isselected:false))
        self.hotelDetailSectionList.append(SectionViewModel(title:"iconWithTitles",isselected:false))
        self.hotelDetailSectionList.append(SectionViewModel(title:"Detail",isselected:false))
        self.hotelDetailSectionList.append(SectionViewModel(title:"Map",isselected:false,icon:"map"))
    self.hotelDetailSectionList.append(SectionViewModel(title:"Facilities",isselected:false,icon:"IconGolfCart"))
        
         self.hotelDetailOptionList.append(FilterOptionViewModel(image: "wifi", name: "18 Holes", title: "18 Holes"))
         self.hotelDetailOptionList.append(FilterOptionViewModel(image: "swimming-pool", name: "18 Holes", title: "18 Holes"))
        
        
        
        self.detailFilterOption.append(FilterOptionViewModel(image: "", name: "All", title: "All",isSelected:true))
        self.detailFilterOption.append(FilterOptionViewModel(image: "", name: "Non Refundable", title: "Non Refundable",isSelected:false))
        self.detailFilterOption.append(FilterOptionViewModel(image: "", name: "Room only", title: "Room only",isSelected:false))
        
        
        self.thingToDoSection.append(SectionViewModel(title:"Open",isselected:false,icon:"iconClock"))
        self.thingToDoSection.append(SectionViewModel(title:"Vouchers",isselected:false,icon:"IconCoupons"))
        
        
        self.reviewList.append(ReviewViewModel())
        self.reviewList.append(ReviewViewModel())
        
        
    }
    
}
