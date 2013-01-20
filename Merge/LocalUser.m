//
//  LocalUser.m
//  Merge
//
//  Created by Jeff Grimes on 1/20/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import "LocalUser.h"

static LocalUser *sharedInstance = nil;

@implementation LocalUser

+ (id)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[LocalUser alloc] init];
    }
    return sharedInstance;
}

@end