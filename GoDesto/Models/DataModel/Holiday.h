//
//  Holiday.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModelProtocols.h"
#import <JSONModel/JSONModel.h>

@interface Holiday : JSONModel

@property (strong,nonatomic) NSString *holidayId;
@property (strong,nonatomic) NSString *voucherType;
@property (strong,nonatomic) NSString *windows;
@property (strong,nonatomic) NSString *terms;
@property (strong,nonatomic) NSString *hubId;

@end
