//
//  Timing.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@interface Timing : JSONModel

@property (strong,nonatomic) NSString * day;
@property (strong,nonatomic) NSString * from;
@property (strong,nonatomic) NSString * to;


@end
