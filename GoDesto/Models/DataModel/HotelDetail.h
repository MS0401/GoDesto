//
//  HotelDetail.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

#import "DataModelProtocols.h"

@interface HotelDetail : JSONModel


@property (strong,nonatomic) NSString * shareUrl;
@property (strong,nonatomic) NSDictionary * hotelInfo;
@property (strong,nonatomic) NSString * noImage;
@property (strong,nonatomic) NSString * images;


@end
