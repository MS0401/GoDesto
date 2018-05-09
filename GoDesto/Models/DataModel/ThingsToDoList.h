//
//  ThingsToDoList.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//


#import "DataModelProtocols.h"
#import <JSONModel/JSONModel.h>
#import "HomeInfo.h"

@interface ThingsToDoList : JSONModel

@property (strong,nonatomic) NSArray<HomeInfo> *thingsToDoList;
@property (strong,nonatomic) NSString *offset;
@property (strong,nonatomic) NSString *query;
@property (strong,nonatomic) NSString *ads;
@end
