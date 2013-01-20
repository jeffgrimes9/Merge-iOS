//
//  NewMerge.m
//  Merge
//
//  Created by Jeff Grimes on 1/19/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import "NewMerge.h"

@interface NewMerge ()
@property (nonatomic) NSInteger activityIndex;
@property (nonatomic, retain) IBOutlet UILabel *timeFROMhour;
@property (nonatomic, retain) IBOutlet UILabel *timeFROMminute;
@property (nonatomic, retain) IBOutlet UILabel *timeFROMmeridian;
@property (nonatomic, retain) IBOutlet UILabel *timeTOhour;
@property (nonatomic, retain) IBOutlet UILabel *timeTOminute;
@property (nonatomic, retain) IBOutlet UILabel *timeTOmeridian;

@property (nonatomic) NSInteger fromHOURS;
@property (nonatomic) NSInteger fromMINS;
@property (nonatomic) NSInteger fromMERIDIAN;
@property (nonatomic) NSInteger toHOURS;
@property (nonatomic) NSInteger toMINS;
@property (nonatomic) NSInteger toMERIDIAN;

@end

@implementation NewMerge

- (id)initWithDefaultCheck:(NSInteger)activityIndex {
    if (self = [super init]) {
        self.activityIndex = activityIndex;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:recognizer];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"HH"];
    int hour = [[dateFormatter stringFromDate:[NSDate date]] intValue];
    
    [dateFormatter setDateFormat:@"mm"];
    int minute = [[dateFormatter stringFromDate:[NSDate date]] intValue];
    
    // round minutes to nearest 15, possibly bumping hour up -MNS
    if (minute < 15) {
        self.fromMINS = 15;
    } else if (minute < 30) {
        self.fromMINS = 30;
    } else if (minute < 45) {
        self.fromMINS = 45;
    } else {
        self.fromMINS = 0;
        hour++;
    }
    self.toMINS = self.fromMINS;
    
    // initial meridian adjustments -MNS
    if (hour < 12) {
        self.fromMERIDIAN = 0;
    } else {
        self.fromMERIDIAN = 1;
    }
    
    // edge meridian cases for when the hour is on the border -MNS
    if (hour == 11) {
        self.toMERIDIAN = 1;
        self.fromMERIDIAN = 0;
    } else if (hour == 23) {
        self.fromMERIDIAN = 0;
        self.toMERIDIAN = 1;
    } else {
        self.toMERIDIAN = self.fromMERIDIAN;
    }
    
    // hour adjustments -MNS
    // we use the (+12) on the hours to simplify the edge case of military 00:xx -MNS
    self.fromHOURS = hour + 12;
    self.toHOURS = hour + 1 + 12; // "to" slot should be an hour more
    if (self.fromHOURS > 12) {
        self.fromHOURS -= 12;
    }
    while (self.toHOURS > 12) {
        self.toHOURS -= 12;
    }
    
    if (self.activityIndex == 0) {
        [self buttonPressed: self.button0];
    } else if (self.activityIndex == 1) {
        [self buttonPressed: self.button1];
    } else if (self.activityIndex == 2) {
        [self buttonPressed: self.button2];
    } else if (self.activityIndex == 3) {
        [self buttonPressed: self.button3];
    }
    
    [self updateTimeLabels];
    
}

- (void)handleSwipeRight:(UISwipeGestureRecognizer *)gestureRecognizer {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)buttonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (button.tag == 0) {
        [self.button0 setImage:[UIImage imageNamed:@"gymnewpressedcheck.png"] forState:UIControlStateNormal];
        [self.button1 setImage:[UIImage imageNamed:@"coffeenewpressed.png"] forState:UIControlStateNormal];
        [self.button2 setImage:[UIImage imageNamed:@"foodnewpressed.png"] forState:UIControlStateNormal];
        [self.button3 setImage:[UIImage imageNamed:@"studynewpressed.png"] forState:UIControlStateNormal];
        self.activityIndex = 0;
    } else if (button.tag == 1) {
        [self.button0 setImage:[UIImage imageNamed:@"gymnewpressed.png"] forState:UIControlStateNormal];
        [self.button1 setImage:[UIImage imageNamed:@"coffeenewpressedcheck.png"] forState:UIControlStateNormal];
        [self.button2 setImage:[UIImage imageNamed:@"foodnewpressed.png"] forState:UIControlStateNormal];
        [self.button3 setImage:[UIImage imageNamed:@"studynewpressed.png"] forState:UIControlStateNormal];
        self.activityIndex = 1;
    } else if (button.tag == 2) {
        [self.button0 setImage:[UIImage imageNamed:@"gymnewpressed.png"] forState:UIControlStateNormal];
        [self.button1 setImage:[UIImage imageNamed:@"coffeenewpressed.png"] forState:UIControlStateNormal];
        [self.button2 setImage:[UIImage imageNamed:@"foodnewpressedcheck.png"] forState:UIControlStateNormal];
        [self.button3 setImage:[UIImage imageNamed:@"studynewpressed.png"] forState:UIControlStateNormal];
        self.activityIndex = 2;
    } else {
        [self.button0 setImage:[UIImage imageNamed:@"gymnewpressed.png"] forState:UIControlStateNormal];
        [self.button1 setImage:[UIImage imageNamed:@"coffeenewpressed.png"] forState:UIControlStateNormal];
        [self.button2 setImage:[UIImage imageNamed:@"foodnewpressed.png"] forState:UIControlStateNormal];
        [self.button3 setImage:[UIImage imageNamed:@"studynewpressedcheck.png"] forState:UIControlStateNormal];
        self.activityIndex = 3;
    }
}

- (IBAction)cancelPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)createPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Time button methods

- (IBAction)FROMhoursPressedUP {
    self.fromHOURS++;
    if (self.fromHOURS == 13) {
        self.fromHOURS = 1;
    } else if (self.fromHOURS == 12) {
        [self FROMmeridianPressed];
    }
    [self updateTimeLabels];
}

- (IBAction)FROMhoursPressedDOWN {
    self.fromHOURS--;
    if (self.fromHOURS == 0) {
        self.fromHOURS = 12;
    } else if (self.fromHOURS == 11) {
        [self FROMmeridianPressed];
    }
    [self updateTimeLabels];
}

- (IBAction)FROMminutesPressedUP {
    self.fromMINS += 15;
    if (self.fromMINS == 60) {
        self.fromMINS = 0;
        [self FROMhoursPressedUP];
    }
    [self updateTimeLabels];
}

- (IBAction)FROMminutesPressedDOWN {
    self.fromMINS -= 15;
    if (self.fromMINS == -15) {
        self.fromMINS = 45;
        [self FROMhoursPressedDOWN];
    }
    [self updateTimeLabels];
}

- (IBAction)FROMmeridianPressed {
    if (self.fromMERIDIAN == 0) {
        self.fromMERIDIAN = 1;
    } else {
        self.fromMERIDIAN = 0;
    }
    [self updateTimeLabels];
}

- (IBAction)TOhoursPressedUP {
    self.toHOURS++;
    if (self.toHOURS == 13) {
        self.toHOURS = 1;
    } else if (self.toHOURS == 12) {
        [self TOmeridianPressed];
    }
    [self updateTimeLabels];
}

- (IBAction)TOhoursPressedDOWN {
    self.toHOURS--;
    if (self.toHOURS == 0) {
        self.toHOURS = 12;
    } else if (self.toHOURS == 11) {
        [self TOmeridianPressed];
    }
    [self updateTimeLabels];
}

- (IBAction)TOminutesPressedUP {
    self.toMINS += 15;
    if (self.toMINS == 60) {
        self.toMINS = 0;
        [self TOhoursPressedUP];
    }
    [self updateTimeLabels];
}

- (IBAction)TOminutesPressedDOWN {
    self.toMINS -= 15;
    if (self.toMINS == -15) {
        self.toMINS = 45;
        [self TOhoursPressedDOWN];
    }
    [self updateTimeLabels];
}

- (IBAction)TOmeridianPressed {
    if (self.toMERIDIAN == 0) {
        self.toMERIDIAN = 1;
    } else {
        self.toMERIDIAN = 0;
    }
    [self updateTimeLabels];
}

- (void)updateTimeLabels {
    [self.timeFROMhour setText:[NSString stringWithFormat:@"%d", self.fromHOURS]];
    [self.timeFROMminute setText:[NSString stringWithFormat:@"%d", self.fromMINS]];
    if ([[self.timeFROMminute text] isEqualToString:@"0"]) {
        [self.timeFROMminute setText:@"00"];
    }
    NSString *meridianFROM = self.fromMERIDIAN == 0 ? @"AM" : @"PM";
    [self.timeFROMmeridian setText:meridianFROM];
    
    
    [self.timeTOhour setText:[NSString stringWithFormat:@"%d", self.toHOURS]];
    [self.timeTOminute setText:[NSString stringWithFormat:@"%d", self.toMINS]];
    if ([[self.timeTOminute text] isEqualToString:@"0"]) {
        [self.timeTOminute setText:@"00"];
    }
    NSString *meridianTO = self.toMERIDIAN == 0 ? @"AM" : @"PM";
    [self.timeTOmeridian setText:meridianTO];
}

@end