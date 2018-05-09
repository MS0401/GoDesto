//
//  AppHelpResponse.h
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "AppHelpResponseData.h"


@interface AppHelpResponse : JSONModel
@property (strong,nonatomic) NSString *status;
@property (strong,nonatomic) NSString *message;
@property (strong,nonatomic) NSString *result;
@property (strong,nonatomic) AppHelpResponseData *data;
@end
