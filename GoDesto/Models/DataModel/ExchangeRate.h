//
//  ExchangeRate.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@interface ExchangeRate : JSONModel

@property (strong,nonatomic) NSString *exchangeId;
@property (strong,nonatomic) NSString *fromCurrency;
@property (strong,nonatomic) NSString *toCurrency;
@property (strong,nonatomic) NSString *rate;
@property (strong,nonatomic) NSString *date;
@property (strong,nonatomic) NSString *symbol;
@property (strong,nonatomic) NSString *position;
@property (strong,nonatomic) NSString *unicode;

@end
