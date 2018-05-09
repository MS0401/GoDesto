//
//  AppHelpResponseData.m
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "AppHelpResponseData.h"

@implementation AppHelpResponseData
+(JSONKeyMapper*)keyMapper
{
    
    
    NSDictionary * dict = @{@"dataID"           : @"id",
                            @"helpTtext"   : @"help_text",
                            @"dated": @"dated",
                            @"image": @"image"
                            };
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}
@end
