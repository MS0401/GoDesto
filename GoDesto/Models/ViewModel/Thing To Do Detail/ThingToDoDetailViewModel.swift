//
//  ThingToDoDetailViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class ThingToDoDetailViewModel {
    
    var toDoDetail:ThingToDoViewModel
    var voucherList:[HolidayViewModel]
    var reviewList:[ThingReviewViewModel]
    var timingList:[OpeningTimesViewModel]
 
    
    init() {
        self.toDoDetail = ThingToDoViewModel()
        self.voucherList = [HolidayViewModel]()
        self.reviewList = [ThingReviewViewModel]()
        self.timingList = [OpeningTimesViewModel]()
    }
    
  convenience  init(thingToDo:ThingToDoDetail) {
        self.init()
        self.toDoDetail = ThingToDoViewModel(dic: thingToDo.hubMain! as NSDictionary)
        
        for item in thingToDo.holidayVoucherList{
            self.voucherList.append(HolidayViewModel(time: item as! Holiday))
        }
        self.reviewList.append(ThingReviewViewModel())
        self.reviewList.append(ThingReviewViewModel())
        for item in thingToDo.reviewList{
            self.reviewList.append(ThingReviewViewModel(review: item as! Review))
        }
        for item in thingToDo.timingList{
            self.timingList.append(OpeningTimesViewModel(time: item as! Timing))
        }
        
        
    }
}
