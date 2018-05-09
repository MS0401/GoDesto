//
//  SearchRegion.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 05/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@interface SearchRegion : JSONModel

@property (strong,nonatomic) NSString * general;
@property (strong,nonatomic) NSString * min;
@property (strong,nonatomic) NSString * max;

@end
