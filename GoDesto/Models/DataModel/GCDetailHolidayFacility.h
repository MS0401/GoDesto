//
//  GCDetailHolidayFacility.h
//  GoDesto
//
//  Created by Muhammad Rashid on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@interface GCDetailHolidayFacility : JSONModel
@property (strong, nonatomic) NSString *holidayFacilityId;
@property (strong, nonatomic) NSString *headline;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *hubId;
@end
