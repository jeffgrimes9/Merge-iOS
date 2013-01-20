//
//  Event.h
//  Merge
//
//  Created by Jeff Grimes on 1/20/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic, retain) NSString *creator;
@property (nonatomic, retain) NSString *category;
@property (nonatomic, retain) NSString *mobile;
@property (nonatomic, retain) NSString *college;
@property (nonatomic, retain) NSDate *dateFrom;
@property (nonatomic, retain) NSDate *dateTo;

@end