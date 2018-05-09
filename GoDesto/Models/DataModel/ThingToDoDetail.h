//
//  ThingToDoDetail.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "DataModelProtocols.h"
#import "Holiday.h"
#import "Review.h"
#import "Timing.h"
@interface ThingToDoDetail : JSONModel

@property (strong,nonatomic) NSDictionary * hubMain;
@property (strong,nonatomic) NSArray<Holiday> * holidayBrunchList;
@property (strong,nonatomic) NSArray<Holiday> * ladiesNightList;
@property (strong,nonatomic) NSArray<Holiday> * holidayVoucherList;
@property (strong,nonatomic) NSArray<Review> * reviewList;
@property (strong,nonatomic) NSArray<Timing> * timingList;
@property (strong,nonatomic) NSArray<Holiday> * hubHappyHours;

@end
