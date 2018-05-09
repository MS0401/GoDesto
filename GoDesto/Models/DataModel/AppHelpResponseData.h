//
//  AppHelpResponseData.h
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>


@interface AppHelpResponseData : JSONModel
@property (strong,nonatomic) NSString *dataID;
@property (strong,nonatomic) NSString *helpTtext;
@property (strong,nonatomic) NSString *dated;
@property (strong,nonatomic) NSString *image;
@end
