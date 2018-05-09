//
//  GolfCourceDetailViewModel.swift
//  GoDesto
//
//  Created by Muhammad Rashid on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class GolfCourseDetailViewModel {
    
    var gcDetailMindBody:GCDetailMindBody;
    var gcDetailResturant:GCDetailResturant;
    var gcDetailHolidayFacility:[GCDetailHolidayFacility];
    var gcDetailHolidayVouchers:[GCDetailHolidayVouchers];
    var gcDetailHubOpeningTime:[GCDetailHubOpeningTime];
    var gcDetailReviews:[GCDetailReviews];
    var gcDetailHolidaysPrice:[GCDetailHolidaysPrice];
    var gcDetailCourse:GCDetailCourse;
    var gcDetailAroundTown:[GCDetailAroundTown];
    var imageBaseUrl:String
    
    init() {
        
        self.gcDetailMindBody = GCDetailMindBody()
        self.gcDetailResturant = GCDetailResturant()
        self.gcDetailHolidayFacility = [GCDetailHolidayFacility]()
        self.gcDetailHolidayVouchers = [GCDetailHolidayVouchers]()
        self.gcDetailHubOpeningTime = [GCDetailHubOpeningTime]();
        self.gcDetailReviews = [GCDetailReviews]();
        self.gcDetailHolidaysPrice = [GCDetailHolidaysPrice]()
        self.gcDetailCourse = GCDetailCourse()
        self.gcDetailAroundTown = [GCDetailAroundTown]()
        self.imageBaseUrl = ""
    }

    init(golfCourseDetal: GolfCourseDetail) {
        
        self.gcDetailMindBody = golfCourseDetal.gcDetailMindBody
        self.gcDetailResturant = golfCourseDetal.gcDetailResturant
        self.gcDetailHolidayFacility = golfCourseDetal.gcDetailHolidayFacility
        self.gcDetailHolidayVouchers = golfCourseDetal.gcDetailHolidayVouchers
        self.gcDetailHubOpeningTime = golfCourseDetal.gcDetailHubOpeningTime
        self.gcDetailReviews = golfCourseDetal.gcDetailReviews
        self.gcDetailHolidaysPrice = golfCourseDetal.gcDetailHolidaysPrice
        self.gcDetailCourse = golfCourseDetal.gcDetailCourse
        self.gcDetailAroundTown = golfCourseDetal.gcDetailAroundTown
        self.imageBaseUrl = golfCourseDetal.imageBaseUrl ?? ""
    }
}
