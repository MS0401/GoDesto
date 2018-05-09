//
//  LoadMoreHotel.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 05/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "DataModelProtocols.h"
#import "Hotel.h"

@interface LoadMoreHotel : JSONModel


@property (strong,nonatomic) NSArray<Hotel> *hotelList;


@end
