//
//  ActivityList.h
//  Merge
//
//  Created by Jeff Grimes on 1/19/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MergeAPI.h"
#import "Event.h"

@interface ActivityList : UITableViewController <UIAlertViewDelegate>

@property (nonatomic, retain) MergeAPI *mergeAPI;
@property (nonatomic, retain) IBOutlet UILabel *activityNameLabel;

- (id)initWithActivity:(NSString *)activityName;
- (IBAction)newMergeButtonPressed:(id)sender;

@end