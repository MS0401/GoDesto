//
//  LandingImage.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "DataModelProtocols.h"

@interface LandingImage : JSONModel

@property (strong,nonatomic) NSString *imageId;
@property (strong,nonatomic) NSString *defaultImage;
@property (strong,nonatomic) NSString *city;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *subTitle;
@property (strong,nonatomic) NSString *imageUrl;
@property (strong,nonatomic) NSString *home;


@end
