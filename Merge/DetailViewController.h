//
//  DetailViewController.h
//  Merge
//
//  Created by Jeff Grimes on 1/18/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
