//
//  MergeAPI.h
//  Merge
//
//  Created by Jeff Grimes on 1/20/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EventProtocol <NSObject>
- (void)gotEvents;
- (void)gotEventsError;
@end

@interface MergeAPI : NSObject

@property (nonatomic, assign) id <EventProtocol> eventDelegate;

@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, retain) NSDictionary *responseDict;
@property (nonatomic, retain) NSMutableArray *responseArray;
@property (nonatomic, assign) SEL successSelector;
@property (nonatomic, assign) SEL failureSelector;

+ (id)sharedInstance;
- (void)getEventsForCategory:(NSString *)category;

@end