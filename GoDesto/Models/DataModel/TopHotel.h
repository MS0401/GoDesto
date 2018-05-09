//
//  TopHotel.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 05/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "DataModelProtocols.h"
#import "Hotel.h"

@interface TopHotel : JSONModel

@property (strong,nonatomic) NSString *general;
@property (strong,nonatomic) NSString *min;
@property (strong,nonatomic) NSString *max;
@property (strong,nonatomic) NSString *currencyMin;
@property (strong,nonatomic) NSString *currencyMax;
@property (strong,nonatomic) NSString *currency;
@property (strong,nonatomic) NSArray<Hotel> *hotelList;
@property (strong,nonatomic) NSString *roomTags;

@end
