//
//  SCViewController.h
//  Merge
//
//  Created by Jeff Grimes on 1/19/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Facebook.h"

@interface SCViewController : UIViewController <FBLoginViewDelegate>

- (IBAction)logoutButtonWasPressed:(id)sender;
- (void)activityPressed:(id)sender;
- (IBAction)buttonDown:(id)sender;
- (IBAction)buttonUp:(id)sender;
- (IBAction)buttonOutside:(id)sender;

@end