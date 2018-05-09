//
//  TIme.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 14/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>


@interface TIme : JSONModel

@property (strong,nonatomic) NSString *value;
@property (strong,nonatomic) NSString *display;

@end
