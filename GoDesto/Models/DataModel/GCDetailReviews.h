//
//  GCDetailReviews.h
//  GoDesto
//
//  Created by Muhammad Rashid on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface GCDetailReviews : JSONModel
@property (strong, nonatomic) NSString *reviewId;
@property (strong, nonatomic) NSString *hubId;
@property (strong, nonatomic) NSString *rated;
@property (strong, nonatomic) NSString *review;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *photo;
@property (strong, nonatomic) NSString *timeAdded;
@end
