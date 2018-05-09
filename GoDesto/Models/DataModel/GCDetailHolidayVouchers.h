//
//  GCDetailHolidayVouchers.h
//  GoDesto
//
//  Created by Muhammad Rashid on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface GCDetailHolidayVouchers : JSONModel
@property (strong, nonatomic) NSString *holidayVoucherId;
@property (strong, nonatomic) NSString *voucherType;
@property (strong, nonatomic) NSString *windows;
@property (strong, nonatomic) NSString *terms;
@property (strong, nonatomic) NSString *hubId;
@end
