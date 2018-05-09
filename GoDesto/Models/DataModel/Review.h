//
//  Review.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
@interface Review : JSONModel

@property (strong,nonatomic) NSString * reviewId;
@property (strong,nonatomic) NSString * hubId;
@property (strong,nonatomic) NSString * rated;
@property (strong,nonatomic) NSString * reviewDetail;
@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) NSString * imageUrl;
@property (strong,nonatomic) NSString * timeAdded;

@end
