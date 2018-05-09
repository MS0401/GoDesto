//
//  GCDetailHubOpeningTime.h
//  GoDesto
//
//  Created by Muhammad Rashid on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface GCDetailHubOpeningTime : JSONModel
@property (strong, nonatomic) NSString *holidayPriceId;
@property (strong, nonatomic) NSString *priceStartingDate;
@property (strong, nonatomic) NSString *priceEndingDate;
@property (strong, nonatomic) NSString *priceType;
@property (strong, nonatomic) NSString *peakType;
@property (strong, nonatomic) NSString *hubId;
@property (strong, nonatomic) NSString *priceToTime;
@property (strong, nonatomic) NSString *priceFromTime;
@property (strong, nonatomic) NSString *priceValue;
@property (strong, nonatomic) NSString *ss;



//@property (strong, nonatomic) NSString *priceStartingDate;
//@property (strong, nonatomic) NSString *priceEndingDate;
//@property (strong, nonatomic) NSString *priceType;
//@property (strong, nonatomic) NSString *peakType;
//@property (strong, nonatomic) NSString *hubId;
//@property (strong, nonatomic) NSString *priceToTime;
//@property (strong, nonatomic) NSString *priceFromTime;
//@property (strong, nonatomic) NSString *priceValue;
//@property (strong, nonatomic) NSString *ss;


@end
