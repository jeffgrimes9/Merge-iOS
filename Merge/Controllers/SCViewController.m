//
//  SCViewController.m
//  Merge
//
//  Created by Jeff Grimes on 1/19/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import "SCViewController.h"
#import "ActivityList.h"
#import "UIViewController+MJPopupViewController.h"
#import "LocalUser.h"

@interface SCViewController ()

@end

@implementation SCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (FBSession.activeSession.isOpen) {
        [self populateUserDetails];
    }
}

- (void)test {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
}

- (IBAction)logoutButtonWasPressed:(id)sender {
    [FBSession.activeSession closeAndClearTokenInformation];
}

- (void)populateUserDetails {
    if (FBSession.activeSession.isOpen) {
        [[FBRequest requestForMe] startWithCompletionHandler:
         ^(FBRequestConnection *connection,
           NSDictionary<FBGraphUser> *user,
           NSError *error) {
             if (!error) {
                 NSLog(@"taster666666: %@", user.id);
             }
         }];
    }
}

- (IBAction)buttonDown:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSString *imageName;
    if (button.tag == 0) {
        imageName = @"gympressedreal.png";
    } else if (button.tag == 1) {
        imageName = @"coffeepressedreal.png";
    } else if (button.tag == 2) {
        imageName = @"foodpressedreal.png";
    } else {
        imageName = @"studypressedreal.png";
    }
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (IBAction)buttonUp:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSString *imageName;
    if (button.tag == 0) {
        imageName = @"gympressed.png";
    } else if (button.tag == 1) {
        imageName = @"coffeepressed.png";
    } else if (button.tag == 2) {
        imageName = @"foodpressed.png";
    } else {
        imageName = @"studypressed.png";
    }
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self activityPressed:sender];
}

- (void)buttonOutside:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSString *imageName;
    if (button.tag == 0) {
        imageName = @"gympressed.png";
    } else if (button.tag == 1) {
        imageName = @"coffeepressed.png";
    } else if (button.tag == 2) {
        imageName = @"foodpressed.png";
    } else {
        imageName = @"studypressed.png";
    }
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void)activityPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSString *activity;
    if (button.tag == 0) {
        activity = @"Gym";
    } else if (button.tag == 1) {
        activity = @"Coffee";
    } else if (button.tag == 2) {
        activity = @"Food";
    } else {
        activity = @"Study";
    }
    ActivityList *activityList = [[ActivityList alloc] initWithActivity:activity];
    [self.navigationController pushViewController:activityList animated:YES];
}

@end