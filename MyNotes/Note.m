//
//  Note.m
//  MyNotes
//
//  Created by Marcus Gubanyi on 10/15/18.
//  Copyright © 2018 CS-CUNE. All rights reserved.
//

#import "Note.h"

@implementation Note

@dynamic red;
@dynamic green;
@dynamic blue;
@dynamic title;
@dynamic text;
@dynamic revisedDate;

+ (Note*)insertNoteWithTitle:(NSString*)title
                        text:(NSString*)text
                         rgb:(NSArray*)rgb
      inManagedObjectContext:(NSManagedObjectContext*)managedObjectContext;
{
    Note* note = [NSEntityDescription insertNewObjectForEntityForName:self.entityName
                                               inManagedObjectContext:managedObjectContext];
    note.title = title;
    note.text = text;
    note.red = [rgb objectAtIndex:0];
    note.green = [rgb objectAtIndex:1];
    note.blue = [rgb objectAtIndex:2];
    note.revisedDate = [NSDate date];
    
    return note;
}

+ (NSString*)entityName
{
    return @"Note";
}

+ (NSDictionary*)colorDictionary
{
    return [NSDictionary dictionaryWithObjects:@[@[@(0.5),@(0.5),@(0.5)],
                                                @[@(0.5),@(0.5),@(0.5)],
                                                @[@(0.5),@(0.5),@(0.5)],
                                                @[@(0.5),@(0.5),@(0.5)],
                                                @[@(0.5),@(0.5),@(0.5)],
                                                @[@(0.5),@(0.5),@(0.5)],
                                                @[@(0.5),@(0.5),@(0.5)],
                                                @[@(0.6),@(0.6),@(0.6)]]
                                       forKeys:@[@"LightBlue", @"Yellow", @"Red", @"Green",
                                                 @"Blue", @"Orange", @"Purple", @"Pink", @"Gray"]];
}


@end
