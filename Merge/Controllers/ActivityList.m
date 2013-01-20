//
//  ActivityList.m
//  Merge
//
//  Created by Jeff Grimes on 1/19/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import "ActivityList.h"
#import "NewMerge.h"
#import "UIViewController+MJPopupViewController.h"

@interface ActivityList () <EventProtocol> {
    NSMutableArray *objects;
}
@property (nonatomic, retain) NSString *activityNameHolder;
@end

@implementation ActivityList

- (id)initWithActivity:(NSString *)activityName {
    if (self = [super init]) {
        self.activityNameHolder = activityName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.activityNameLabel setText:self.activityNameHolder];
    [[self navigationController] setNavigationBarHidden:YES];
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.tableView addGestureRecognizer:recognizer];
    
    self.mergeAPI = [MergeAPI sharedInstance];
    self.mergeAPI.eventDelegate = self;
    [self.mergeAPI getEventsForCategory:self.activityNameHolder];
}

- (void)handleSwipeRight:(UISwipeGestureRecognizer *)gestureRecognizer {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Event *event = objects[indexPath.row];
    cell.textLabel.text = event.creator;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int index = [indexPath item];
    Event *event = [objects objectAtIndex:index];
    NSLog(@"%@: %@", event.creator, event.mobile);
    
    NSString *phoneNumber = [@"telprompt://" stringByAppendingString:event.mobile];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Are you getting food with Max?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    alert.delegate = self;
    [alert show];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != 0) {
        [objects removeObjectAtIndex:objects.count - 1];
        [self.tableView reloadData];
    }
}

- (void)gotEvents {
    int numEvents = [[self.mergeAPI.responseDict objectForKey:@"events"] count];
    
    for (int i = 0; i < numEvents; i++) {
        Event *event = [[Event alloc] init];
        
        event.creator = [[[[self.mergeAPI.responseDict objectForKey:@"events"] objectAtIndex:i] objectForKey:@"initiator"] objectForKey:@"name"];
        event.category = [[[self.mergeAPI.responseDict objectForKey:@"events"] objectAtIndex:i] objectForKey:@"category"];
        event.mobile = [[[[self.mergeAPI.responseDict objectForKey:@"events"] objectAtIndex:i] objectForKey:@"initiator"] objectForKey:@"mobile"];
        event.college = [[[[self.mergeAPI.responseDict objectForKey:@"events"] objectAtIndex:i] objectForKey:@"initiator"] objectForKey:@"university_id"];
        NSString *dateString = [[[self.mergeAPI.responseDict objectForKey:@"events"] objectAtIndex:i] objectForKey:@"startdate"];
        event.dateFrom = [NSDate dateWithTimeIntervalSince1970:[dateString doubleValue]];
        dateString = [[[self.mergeAPI.responseDict objectForKey:@"events"] objectAtIndex:i] objectForKey:@"enddate"];
        event.dateTo = [NSDate dateWithTimeIntervalSince1970:[dateString doubleValue]];
        
        [self insertEvent:event];
    }
}

- (void)insertEvent:(Event *)event {
    if (!objects) {
        objects = [[NSMutableArray alloc] init];
    }
    
    [objects insertObject:event atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)gotEventsError {
    
}

- (IBAction)newMergeButtonPressed:(id)sender {
    NSInteger index = -1;
    if (self.activityNameHolder == @"Gym") index = 0;
    else if (self.activityNameHolder == @"Coffee") index = 1;
    else if (self.activityNameHolder == @"Food") index = 2;
    else if (self.activityNameHolder == @"Study") index = 3;
    
    NewMerge *newMergeController = [[NewMerge alloc] initWithDefaultCheck:index];
    [self.navigationController pushViewController:newMergeController animated:YES];
}

@end