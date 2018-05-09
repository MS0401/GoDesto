//
//  HoteRoom.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@interface HoteRoom : JSONModel

@property (strong, nonatomic) NSString * quoteId;
@property (strong, nonatomic) NSString * roomText;
@property (strong, nonatomic) NSString * roomDescription;
@property (strong, nonatomic) NSString * showPriceSelection;
@property (strong, nonatomic) NSString * showPriceSep;
@property (strong, nonatomic) NSString * previousPrice;
@property (strong, nonatomic) NSString * dataPreviousPrice;
@property (strong, nonatomic) NSString * dataCurrentPrice;

@end
