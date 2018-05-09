//
//  Login.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 22/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "Login.h"

@implementation Login

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
    {
        NSDictionary * dict = @{ @"loginId"                 : @"id",
                                 @"email"                   : @"bill_email",
                                 @"date"                    : @"dated",
                                 @"firstName"               : @"bill_fname",
                                 @"lastName"                : @"bill_sname",
                                 @"addUrl"                  : @"bill_addr1",
                                 @"city"                    : @"bill_city",
                                 @"region"                  : @"bill_region",
                                 @"country"                 : @"bill_country",
                                 @"title"                   : @"bill_title",
                                 @"zip"                     : @"bill_zip",
                                 @"password"                : @"bill_password",
                                 @"registerFC"              : @"register_fc",
                                 @"refferalCode"            : @"user_ref_code",
                                 @"travelCredit"            : @"travel_credit",
                                 @"phone"                   : @"bill_phone",
                                 @"letterDuration"          : @"newsletter_duration",
                                 @"countryCode"             : @"bill_country_code",
                                 @"tenPlus"                 : @"welcome_ten_plus",
                                 @"forgotLink"              : @"forgot_link",
                                 @"wish"                    : @"wish",
                                 @"unsub"                   : @"unsub",
                                 @"app"                     : @"app",
                                 @"directLink"              : @"direct_link_time",
                                 @"dirwctLinkTime"          : @"direct_link",
                                 @"emailTextFriend"         : @"email_text_for_friend"
                                 };
        
        return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
        
    }

@end
