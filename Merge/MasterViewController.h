//
//  MasterViewController.h
//  Merge
//
//  Created by Jeff Grimes on 1/18/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
