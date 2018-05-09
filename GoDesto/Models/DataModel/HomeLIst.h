//
//  HomeLIst.h
//  GoDesto
//
//  Created by Rudaba Fatima on 4/8/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "DataModelProtocols.h"
#import "HomeInfo.h"
#import "HomeCategory.h"
@interface HomeLIst : JSONModel

@property (strong,nonatomic) NSString * baseUrl;
@property (strong,nonatomic) NSString * baseImageUrl;
@property (strong,nonatomic) NSArray * blog;
@property (strong,nonatomic) NSArray<HomeInfo> * restaurant;
@property (strong,nonatomic) NSArray<HomeInfo> * happyHour;
@property (strong,nonatomic) NSArray<HomeInfo> * brunches;
@property (strong,nonatomic) NSArray<HomeInfo> * ladiesNite;
@property (strong,nonatomic) NSArray<HomeCategory> * categories;
@property (strong,nonatomic) NSArray * appCities;


@end
