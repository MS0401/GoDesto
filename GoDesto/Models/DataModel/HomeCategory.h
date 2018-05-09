//
//  HomeCategory.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
@interface HomeCategory : JSONModel

@property (strong,nonatomic) NSString *catId;
@property (strong,nonatomic) NSString *catText;
@property (strong,nonatomic) NSString *catField;
@property (strong,nonatomic) NSString *appImage;
@property (strong,nonatomic) NSString *view;
@property (strong,nonatomic) NSString *city;
@property (strong,nonatomic) NSString *actionType;


@end
