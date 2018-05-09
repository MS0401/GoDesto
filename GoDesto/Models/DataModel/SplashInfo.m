//
//  SplashInfo.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 22/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "SplashInfo.h"

@implementation SplashInfo
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
    {
        NSDictionary * dict = @{ @"landingImages"       : @"landing_images",
                                 @"exchangeInfo"        : @"exchange_rate",
                                 @"appInfo"             : @"splash_screen_text",
                                 @"ipInfoList"          : @"ip_detect"
                                 
                                 };
        
        return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
        
    }

@end
