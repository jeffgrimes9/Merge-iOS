//
//  ActivityList.h
//  Merge
//
//  Created by Jeff Grimes on 1/19/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityList : UITableViewController

@property (nonatomic, retain) IBOutlet UILabel *activityNameLabel;

- (id)initWithActivity:(NSString *)activityName;

@end