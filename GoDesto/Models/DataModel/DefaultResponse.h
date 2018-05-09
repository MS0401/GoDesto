//
//  DefaultResponse.h
//  CabIOS
//
//  Created by Ghafar Tanveer on 09/02/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DefaultResponse : JSONModel

@property (strong,nonatomic) NSString *status;
@property (strong,nonatomic) NSString *message;

@end
