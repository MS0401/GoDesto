//
//  LoadMoreHotel.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 05/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "LoadMoreHotel.h"

@implementation LoadMoreHotel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{@"hotelList"        : @"data"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
