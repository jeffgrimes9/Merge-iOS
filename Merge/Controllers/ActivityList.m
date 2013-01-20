//
//  ActivityList.m
//  Merge
//
//  Created by Jeff Grimes on 1/19/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import "ActivityList.h"
#import "NewMerge.h"

@interface ActivityList () {
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
    
    NSDate *object = objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // HANDLE LOGIC FOR MESSAGE/CALL
}

- (IBAction)insertNewMerge:(id)sender {
    if (!objects) {
        objects = [[NSMutableArray alloc] init];
    }
        
    NewMerge *newMergeController = [[NewMerge alloc] init];
    [self.navigationController pushViewController:newMergeController animated:YES];
    
//    [objects insertObject:@"PUT OBJECT HERE" atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


@end