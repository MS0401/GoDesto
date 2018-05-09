//
//  GCDetailReviews.m
//  GoDesto
//
//  Created by Muhammad Rashid on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "GCDetailReviews.h"

@implementation GCDetailReviews
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{
                            @"reviewId" : @"id",
                            @"hubId" : @"hub_id",
                            @"rated" : @"rated",
                            @"review" : @"review",
                            @"name" : @"name",
                            @"photo" : @"photo",
                            @"timeAdded" : @"time_added",
                            };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
}
@end
