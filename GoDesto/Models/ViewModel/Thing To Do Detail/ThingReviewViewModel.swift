//
//  ThingReviewViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class ThingReviewViewModel {
    var reviewId:String
    var hubId:String
    var rated:String
    var reviewDetail:String
    var name:String
    var imageUrl:String
    var timeAdded:String
    
    init() {
        self.reviewId = ""
        self.hubId = ""
        self.rated = ""
        self.reviewDetail = ""
        self.name = ""
        self.imageUrl = ""
        self.timeAdded = ""
    }
    init(review:Review) {
        self.reviewId = review.reviewId ?? ""
        self.hubId = review.hubId ?? ""
        self.rated = review.rated ?? ""
        self.reviewDetail = review.reviewDetail ?? ""
        self.name = review.name ?? ""
        self.imageUrl = review.imageUrl ?? ""
        self.timeAdded = review.timeAdded ?? ""
    }
}
