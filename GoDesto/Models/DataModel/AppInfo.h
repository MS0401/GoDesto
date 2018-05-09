//
//  AppInfoTableViewCell.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@interface AppInfo: JSONModel

@property (strong,nonatomic) NSString *infoId;
@property (strong,nonatomic) NSString *globalText;
@property (strong,nonatomic) NSString *DubaiText;

@end
