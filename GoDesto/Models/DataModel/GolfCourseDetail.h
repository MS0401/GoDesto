//
//  GolfCourseDetail.h
//  GoDesto
//
//  Created by Muhammad Rashid on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "DataModelProtocols.h"
#import "GCDetailMindBody.h"
#import "GCDetailResturant.h"
#import "GCDetailHolidayFacility.h"
#import "GCDetailHolidayVouchers.h"
#import "GCDetailHubOpeningTime.h"
#import "GCDetailReviews.h"
#import "GCDetailHolidaysPrice.h"
#import "GCDetailCourse.h"
#import "GCDetailAroundTown.h"

@interface GolfCourseDetail : JSONModel
@property (strong, nonatomic) GCDetailMindBody *gcDetailMindBody;
@property (strong, nonatomic) GCDetailResturant *gcDetailResturant;
@property (strong, nonatomic) NSArray <GCDetailHolidayFacility*> *gcDetailHolidayFacility;
@property (strong, nonatomic) NSArray <GCDetailHolidayVouchers *> *gcDetailHolidayVouchers;
@property (strong, nonatomic) NSArray <GCDetailHubOpeningTime *> *gcDetailHubOpeningTime;
@property (strong, nonatomic) NSArray <GCDetailReviews *> *gcDetailReviews;
@property (strong, nonatomic) NSArray <GCDetailHolidaysPrice *> *gcDetailHolidaysPrice;
@property (strong, nonatomic) GCDetailCourse *gcDetailCourse;
@property (strong, nonatomic) NSArray<GCDetailAroundTown*>* gcDetailAroundTown;
@property (strong, nonatomic) NSString *imageBaseUrl;
@end
