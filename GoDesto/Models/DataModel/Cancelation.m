//
//  Cancelation.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "Cancelation.h"

@implementation Cancelation

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"status"              : @"status",
                             @"quoteId"               : @"quote_id"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
