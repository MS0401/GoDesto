//
//  GolfList.m
//  GoDesto
//
//  Created by Muhammad Rashid on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "GolfCourseList.h"

@implementation GolfCourseList
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"gId"                         : @"id",
                             @"name"                        : @"name",
                             @"rating"                      : @"rating",
                             @"ratingText"                  : @"rating_text",
                             @"courseType"                  : @"course_type",
                             @"grassType"                   : @"grass_type",
                             @"holes"                       : @"holes",
                             @"bookingEmailAddress"         : @"booking_email_address",
                             @"address"                     : @"address",
                             @"images"                      : @"images",
                             @"coverPhoto"                  : @"cover_photo",
                             @"city"                        : @"city",
                             @"type"                        :@"type",
                             @"price"                       :@"price",
                             @"videos"                      : @"videos",
                             @"country"                     : @"country",
                             @"category"                    : @"category",
                             @"kind"                        : @"kind",
                             @"url"                         : @"url",
                             @"categoryurl"                 : @"categoryurl",
                             @"packType"                    : @"pack_type",
                             @"subPackTypeUrl"              : @"sub_pack_type_url",
                             @"packTypeUrl"                 : @"pack_type_url",
                             @"subPackType"                 : @"sub_pack_type",
                             @"nights"                      : @"nights",
                             @"isLive"                      : @"is_live",
                             @"coverBigPhoto"               : @"cover_big_photo",
                             @"tos"                         : @"tos",
                             @"pdf"                         : @"pdf",
                             @"connectedWhatson"            : @"connected_whatson",
                             @"viewOrder"                   : @"view_order",
                             @"hubImages"                   : @"hub_images",
                             @"hubMaps"                     : @"hub_maps",
                             @"cuisine"                     : @"cuisine",
                             @"phoneNumber"                 : @"phone_number",
                             @"liveEnter"                   : @"live_enter",
                             @"music"                       : @"music",
                             @"serveAlcohol"                : @"serve_alcohol",
                             @"brunches"                    : @"brunches",
                             @"happyHour"                   : @"happy_hour",
                             @"ladiesNite"                  : @"ladies_nite",
                             @"childrenWelcome"             : @"children_welcome",
                             @"menuUpload"                  : @"menu_upload",
                             @"acceptVoucher"               : @"accept_voucher",
                             @"majorType"                   : @"major_type",
                             @"contactName"                 : @"contact_name",
                             @"area"                        : @"area",
                             @"wheelchairAcc"               : @"wheelchair_acc",
                             @"valParking"                  : @"val_parking",
                             @"parking"                     : @"parking",
                             @"outdoorSeating"              : @"outdoor_seating",
                             @"wifi"                        : @"wifi",
                             @"sheesha"                     : @"sheesha",
                             @"dressCode"                   : @"dress_code",
                             @"ageRestrict"                 : @"age_restrict",
                             @"heightRestrict"              : @"height_restrict",
                             @"takeAway"                    : @"take_away",
                             @"shortDescription"            : @"short_description",
                             @"openNow"                     : @"open_now"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}
@end
