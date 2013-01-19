//
//  SCLoginViewController.m
//  Merge
//
//  Created by Jeff Grimes on 1/19/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import "AppDelegate.h"
#import "SCLoginViewController.h"

@interface SCLoginViewController ()
- (IBAction)performLogin:(id)sender;
@property(strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation SCLoginViewController
@synthesize spinner;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)performLogin:(id)sender {
    [self.spinner startAnimating];
    
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate openSession];
}

- (void)loginFailed {
    // User switched back to the app without authorizing. Stay here, but
    // stop the spinner.
    [self.spinner stopAnimating];
}

@end
