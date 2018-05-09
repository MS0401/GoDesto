//
//  HomeInfo.m
//  GoDesto
//
//  Created by Rudaba Fatima on 4/8/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "HomeInfo.h"

@implementation HomeInfo


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}

+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"hotelId"                         : @"id",
                             @"name"                            : @"name",
                             @"bookingEmailAddress"             : @"booking_email_address",
                             @"designer"                        : @"designer",
                             @"grassType"                       : @"grass_type",
                             @"courseType"                      : @"course_type",
                             @"holes"                           : @"holes",
                             @"establishedIn"                   : @"established_in",
                             @"courseLength"                    : @"course_length",
                             @"par"                             : @"par",
                             @"bodyCopy"                        : @"body_copy",
                             @"address"                         : @"address",
                             @"images"                          : @"images",
                             @"coverPhoto"                      :@"cover_photo",
                             @"city"                            :@"city",
                             @"type"                            : @"type",
                             @"price"                           : @"price",
                             @"videos"                          : @"videos",
                             @"country"                         : @"country",
                             @"category"                        :@"category",
                             @"kind"                            :@"kind",
                             @"url"                             : @"url",
                             @"categoryUrl"                     : @"categoryurl",
                             @"packType"                        : @"pack_type",
                             @"subPackTypeUrl"                  : @"sub_pack_type_url",
                             @"packTypeUrl"                     :@"pack_type_url",
                             @"subPackType"                     :@"sub_pack_type",
                             @"nights"                          : @"nights",
                             @"isLive"                          : @"is_live",
                             @"coverBigPhoto"                   : @"cover_big_photo",
                             @"tos"                             : @"tos",
                             @"pdf"                             :@"pdf",
                             @"connectedWhatson"                :@"connectedWhatson",
                             @"viewOrder"                       : @"view_order",
                             @"hubImages"                       : @"hub_images",
                             @"hubMaps"                         : @"hub_maps",
                             @"hubOptions"                      : @"hub_options",
                             @"hubSpOffers"                     :@"hub_sp_offers",
                             @"hubPdfs"                         :@"hub_pdfs",
                             @"commision"                       : @"commision",
                             @"video"                           : @"video",
                             @"holes9From"                      : @"holes_9_from",
                             @"holes9To"                        : @"holes_9_to",
                             @"holes18From"                     :@"holes_18_from",
                             @"holes18To"                       :@"holes_18_to",
                             @"cuisine"                         : @"cuisine",
                             @"phoneNumber"                     : @"phone_number",
                             @"liveEnter"                       : @"live_enter",
                             @"music"                           : @"music",
                             @"serveAlcohol"                    :@"serve_alcohol",
                             @"brunches"                        :@"brunches",
                             @"happyHour"                       : @"happy_hour",
                             @"ladiesNite"                      : @"ladies_nite",
                             @"childrenWelcome"                 : @"children_welcome",
                             @"menuUpload"                      : @"menu_upload",
                             @"acceptVoucher"                   :@"accept_voucher",
                             @"majorType"                       :@"major_type",
                             @"contactName"                     : @"contact_name",
                             @"area"                            : @"area",
                             @"wheelchairAcc"                   : @"wheelchair_acc",
                             @"valParking"                      : @"val_parking",
                             @"parking"                         :@"parking",
                             @"outdoorSeating"                  :@"outdoor_seating",
                             @"wifi"                            : @"wifi",
                             @"sheesha"                         : @"sheesha",
                             @"dressCode"                       : @"dress_code",
                             @"ageRestrict"                     : @"age_restrict",
                             @"heightRestrict"                  :@"height_restrict",
                             @"takeAway"                        :@"take_away",
                             @"mName"                           : @"m_name",
                             @"mNumber"                         : @"m_number",
                             @"mEmail"                          : @"m_email",
                             @"mStatus"                         : @"m_status",
                             @"adminBy"                         :@"admin_by",
                             @"shortDescription"                :@"short_description",
                             @"openNow"                         : @"open_now",
                             @"distanceFromUser"                : @"distance_from_user",
                             @"spa"                             : @"spa",
                             @"indoor"                          : @"indoor",
                             @"outdoor"                         :@"outdoor",
                             @"zomatoLink"                      :@"z",
                             @"bars"                            : @"bars",
                             @"votes"                           : @"votes",
                             @"rating"                          : @"rating",
                             @"address2"                        : @"address2",
                             @"lat"                             :@"lat",
                             @"lng"                             :@"lng",
                             @"placeId"                         : @"place_id",
                             @"name2"                           : @"name_2",
                             @"ratingText"                      : @"rating_text"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}


@end

