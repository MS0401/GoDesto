//
//  HotelDetail.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "HotelDetail.h"

@implementation HotelDetail

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"shareUrl"           : @"share_url",
                             @"hotelInfo"          : @"hotel_info",
                             @"noImage"            : @"no_image",
                             @"images"             : @"images"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

@end
