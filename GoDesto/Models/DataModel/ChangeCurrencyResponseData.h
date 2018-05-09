//
//  ChangeCurrencyResponseData.h
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface ChangeCurrencyResponseData : JSONModel
@property (strong,nonatomic) NSString *dataID;
@property (strong,nonatomic) NSString *fromCurrency;
@property (strong,nonatomic) NSString *toCurrency;
@property (strong,nonatomic) NSString *rate;
@property (strong,nonatomic) NSString *dated;
@property (strong,nonatomic) NSString *symbol;
@property (strong,nonatomic) NSString *position;
@property (strong,nonatomic) NSString *unicode;
@end
