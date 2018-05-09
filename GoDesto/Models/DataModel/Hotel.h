//
//  Hotel.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 05/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@interface Hotel : JSONModel

@property (strong,nonatomic) NSString * findinBooking;
@property (strong,nonatomic) NSString * updateMain;
@property (strong,nonatomic) NSString * photo;
@property (strong,nonatomic) NSString * updatedServer;
@property (strong,nonatomic) NSString * city;
@property (strong,nonatomic) NSString * hotelType;
@property (strong,nonatomic) NSString * averageRating;
@property (strong,nonatomic) NSString * collectionOfRooms;
@property (strong,nonatomic) NSString * roomText;
@property (strong,nonatomic) NSString * roomDescription;
@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) NSString * hotelCode;
@property (strong,nonatomic) NSString * longitute;
@property (strong,nonatomic) NSString * latitute;
@property (strong,nonatomic) NSString * rating;
@property (strong,nonatomic) NSString * hotelAddress;
@property (strong,nonatomic) NSString * mainImage;
@property (strong,nonatomic) NSString * distance;
@property (strong,nonatomic) NSString * amenity;
@property (strong,nonatomic) NSString * price;
@property (strong,nonatomic) NSString * priceWithCurrency;
@property (strong,nonatomic) NSString * paramDate;
@property (strong,nonatomic) NSString * type;
@property (strong,nonatomic) NSString * orignalAmount;
@property (strong,nonatomic) NSString * pAmount;
@property (strong,nonatomic) NSString * taxValueText;
@property (strong,nonatomic) NSString * mealTypes;
@property (strong,nonatomic) NSString * sessionId;
@end
