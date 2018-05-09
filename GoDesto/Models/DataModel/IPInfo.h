//
//  IPInfo.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>


@interface IPInfo : JSONModel

@property (strong,nonatomic) NSString *currencyCode;
@property (strong,nonatomic) NSString *iso;
@property (strong,nonatomic) NSString *ipFrom;
@property (strong,nonatomic) NSString *ipTo;
@property (strong,nonatomic) NSString *countryCode;
@property (strong,nonatomic) NSString *countryname;



@end
