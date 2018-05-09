//
//  CancelationList.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "Cancelation.h"
#import "DataModelProtocols.h"

@interface CancelationList : JSONModel

@property (strong,nonatomic) NSArray<Cancelation> * cancelationList;

@end
