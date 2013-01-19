//
//  ActivityList.m
//  Merge
//
//  Created by Jeff Grimes on 1/19/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import "ActivityList.h"

@interface ActivityList ()
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
    
    // left-swipe gesture git srecognizer
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.tableView addGestureRecognizer:recognizer];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end