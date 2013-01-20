//
//  LocalUser.h
//  Merge
//
//  Created by Jeff Grimes on 1/20/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalUser : NSObject

@property (nonatomic, retain) NSString *userID;
@property (nonatomic, retain) NSString *college;

+ (id)sharedInstance;

@end