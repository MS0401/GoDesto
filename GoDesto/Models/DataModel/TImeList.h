//
//  TImeList.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 14/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "DataModelProtocols.h"
#import "TIme.h"

@interface TImeList : JSONModel

@property (strong,nonatomic) NSArray<TIme> *sunday;
@property (strong,nonatomic) NSArray<TIme> *monday;
@property (strong,nonatomic) NSArray<TIme> *tuesday;
@property (strong,nonatomic) NSArray<TIme> *wednesday;
@property (strong,nonatomic) NSArray<TIme> *thursday;
@property (strong,nonatomic) NSArray<TIme> *friday;
@property (strong,nonatomic) NSArray<TIme> *satuarday;


@end
