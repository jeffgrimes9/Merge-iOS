//
//  DataStorage.h
//  Merge
//
//  Created by Jeff Grimes on 1/20/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStorage : NSObject

@property (nonatomic, retain) NSMutableDictionary *KVstore;

+ (id)sharedInstance;

- (void)addAPItoken:(NSString *)token forFBid:(NSString *)id;

@end