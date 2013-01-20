//
//  DataStorage.m
//  Merge
//
//  Created by Jeff Grimes on 1/20/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import "DataStorage.h"

static DataStorage *sharedInstance = nil;

@implementation DataStorage

+ (id)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[DataStorage alloc] init];
    }
    return sharedInstance;
}

- (void)addAPItoken:(NSString *)token forFBid:(NSString *)id {
    if (!self.KVstore) {
        self.KVstore = [[NSMutableDictionary alloc] init];
    }
    [self.KVstore setObject:token forKey:id];
}

@end