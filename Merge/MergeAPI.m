//
//  MergeAPI.m
//  Merge
//
//  Created by Jeff Grimes on 1/20/13.
//  Copyright (c) 2013 Jeff Grimes. All rights reserved.
//

#import "MergeAPI.h"
#import "DataStorage.h"

static MergeAPI *sharedInstance = nil;

@implementation MergeAPI

+ (id)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[MergeAPI alloc] init];
    }
    return sharedInstance;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"connection error: %@", error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSError *error = nil;
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableContainers error:&error];
    
    if (error) {
        NSLog(@"decent error:      %@", error);
        [self performSelector:self.failureSelector];
        return;
    }
    
    if ([jsonObjects isKindOfClass:[NSArray class]]) {
        self.responseArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < [jsonObjects count]; i++) {
            [self.responseArray addObject:[jsonObjects objectAtIndex:i]];
        }
    } else {
        NSArray *keys = [jsonObjects allKeys];
        NSMutableArray *values = [[NSMutableArray alloc] init];
        for (NSString *key in keys) {
            [values addObject:[jsonObjects objectForKey:key]];
        }
        self.responseDict = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
    }
    
    [self performSelector:self.successSelector];
}

- (void)getEventsForCategory:(NSString *)category {
    self.successSelector = @selector(callGotEvents);
    self.failureSelector = @selector(callGotEventsError);
    
    self.responseData = [NSMutableData data];
    NSString *secret = [[[DataStorage sharedInstance] KVstore] valueForKey:@""];
    NSString *urlString = [NSString stringWithFormat:@"http://mergeapp.herokuapp.com/event/%@/%@", @"8B8fuwxlnZ7HfQjUTvUGjXAbEw49ghI9", category];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)callGotEvents {
    [self.eventDelegate gotEvents];
}

- (void)callGotEventsError {
    [self.eventDelegate gotEventsError];
}

@end