//
//  PreBookInfo.h
//  GoDesto
//
//  Created by Le Abid on 19/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface PreBookInfo : JSONModel

@property (strong,nonatomic) NSString *stay;
@property (strong,nonatomic) NSString *contractType;
@property (strong,nonatomic) NSString *roomType;
@property (strong,nonatomic) NSString *price;
@property (strong,nonatomic) NSString *taxIncludedText;
@property (strong,nonatomic) NSString *cancelationText;
@property (strong,nonatomic) NSString *cancelationInfoText;
@property (strong,nonatomic) NSString *terms;

@end
