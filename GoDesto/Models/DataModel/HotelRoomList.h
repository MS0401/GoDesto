//
//  HotelRoomList.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "DataModelProtocols.h"
#import "HoteRoom.h"

@interface HotelRoomList : JSONModel

@property (strong,nonatomic) NSDictionary *textValue;
@property (strong,nonatomic) NSArray<HoteRoom> *roomList;

@end
