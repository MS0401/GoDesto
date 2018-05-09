//
//  Login.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 22/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@interface Login : JSONModel
    @property(weak,nonatomic) NSString *loginId;
    @property(weak,nonatomic) NSString *email;
    @property(weak,nonatomic) NSString *date;
    @property(weak,nonatomic) NSString *firstName;
    @property(weak,nonatomic) NSString *lastName;
    @property(weak,nonatomic) NSString *addUrl;
    @property(weak,nonatomic) NSString *city;
    @property(weak,nonatomic) NSString *region;
    @property(weak,nonatomic) NSString *country;
    @property(weak,nonatomic) NSString *title;
    @property(weak,nonatomic) NSString *zip;
    @property(weak,nonatomic) NSString *password;
    @property(weak,nonatomic) NSString *registerFC;
    @property(weak,nonatomic) NSString *refferalCode;
    @property(weak,nonatomic) NSString *travelCredit;
    @property(weak,nonatomic) NSString *phone;
    @property(weak,nonatomic) NSString *letterDuration;
    @property(weak,nonatomic) NSString *countryCode;
    @property(weak,nonatomic) NSString *tenPlus;
    @property(weak,nonatomic) NSString *forgotLink;
    @property(weak,nonatomic) NSString *wish;
    @property(weak,nonatomic) NSString *unsub;
    @property(weak,nonatomic) NSString *app;
    @property(weak,nonatomic) NSString *directLink;
    @property(weak,nonatomic) NSString *dirwctLinkTime;
    @property(weak,nonatomic) NSString *emailTextFriend;
    

@end
