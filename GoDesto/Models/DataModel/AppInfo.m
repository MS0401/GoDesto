//
//  AppInfoTableViewCell.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"infoId"           : @"id",
                             @"globalText"       : @"global_text",
                             @"DubaiText"        : @"dubai_text"
                             };
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
