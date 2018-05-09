//
//  Hotel.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 05/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "Hotel.h"

@implementation Hotel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"findinBooking"           : @"find_in_booking",
                             @"updateMain"              : @"update_main",
                             @"photo"                   : @"photos",
                             @"updatedServer"           : @"updated_server",
                             @"city"                    : @"city",
                             @"hotelType"               : @"hotel_type",
                             @"averageRating"           : @"average_rating",
                             @"collectionOfRooms"       : @"collection_of_rooms_cache",
                             @"roomText"                : @"RoomText",
                             @"roomDescription"         : @"RoomDescription",
                             @"name"                    : @"name",
                             @"hotelCode"               : @"HotelCode",
                             @"longitute"               : @"Longitude",
                             @"latitute"                :@"Latitude",
                             @"rating"                  :@"rating",
                             @"hotelAddress"            : @"HotelAddress",
                             @"mainImage"               : @"main_image",
                             @"distance"                : @"Distance",
                             @"amenity"                 : @"Amenity",
                             @"price"                   : @"price",
                             @"priceWithCurrency"       : @"price_with_currency",
                             @"paramDate"               : @"param_date",
                             @"type"                    : @"type",
                             @"orignalAmount"           : @"OriginalAmount",
                             @"pAmount"                 : @"PAmount",
                             @"taxValueText"            : @"tax_value_text",
                             @"mealTypes"               : @"meal_types",
                             @"sessionId"               : @"session_id"
                             
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}
@end
