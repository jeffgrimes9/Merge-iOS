//
//  NewMerge.h
//  Merge
//
//  Created by Jeff Grimes on 1/19/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewMerge : UIViewController

@property (nonatomic, retain) IBOutlet UIButton *button0;
@property (nonatomic, retain) IBOutlet UIButton *button1;
@property (nonatomic, retain) IBOutlet UIButton *button2;
@property (nonatomic, retain) IBOutlet UIButton *button3;

- (id)initWithDefaultCheck:(NSInteger)activityIndex;

- (IBAction)buttonPressed:(id)sender;

- (IBAction)FROMhoursPressedUP;
- (IBAction)FROMhoursPressedDOWN;
- (IBAction)FROMminutesPressedUP;
- (IBAction)FROMminutesPressedDOWN;
- (IBAction)FROMmeridianPressed;
- (IBAction)TOhoursPressedUP;
- (IBAction)TOhoursPressedDOWN;
- (IBAction)TOminutesPressedUP;
- (IBAction)TOminutesPressedDOWN;
- (IBAction)TOmeridianPressed;

- (IBAction)cancelPressed;
- (IBAction)createPressed;

@end