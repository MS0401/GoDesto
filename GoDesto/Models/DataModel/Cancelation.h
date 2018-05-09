//
//  Cancelation.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@interface Cancelation : JSONModel

@property (strong,nonatomic) NSString *status;
@property (strong,nonatomic) NSString *quoteId;

@end
