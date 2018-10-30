//
//  Settings.m
//  MyNotes
//
//  Created by Marcus Gubanyi on 10/29/18.
//  Copyright © 2018 CS-CUNE. All rights reserved.
//

#import "Settings.h"

@implementation Settings

+ (NSSortDescriptor*)noteSortDescriptor
{
    NSString *key = [[NSUserDefaults standardUserDefaults] stringForKey:@"noteSortDescriptor"];
    if (![[Settings noteSortDescriptorOptions] containsObject:key])
    {
        // Set default to createdDate
        key = @"createdDate";
        [Settings setNoteSortDescriptorWithKey:@"createdDate"];
    }
    
    // Title is ascending order - the created and revised dates are descending order.
    BOOL ascending = !([key isEqualToString:@"title"]);

    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:ascending];
    
    return descriptor;
}

+ (void)setNoteSortDescriptorWithKey:(NSString*)key
{
    if ([[Settings noteSortDescriptorOptions] containsObject:key])
    {
        [[NSUserDefaults standardUserDefaults] setObject:key forKey:@"noteSortDescriptor"];
    }
    return;
}

+ (NSArray*)noteSortDescriptorOptions
{
    return @[@"createdDate", @"revisedDate", @"title"];
    //[NSDictionary dictionaryWithObjects:@[@"Last Revised First", @"Last Created First", @"Alphabetical by Title"]
    //                                   forKeys:@[@"revisedDate", @"createdDate", @"title"]];
}

@end
