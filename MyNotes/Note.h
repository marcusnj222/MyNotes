//
//  Note.h
//  MyNotes
//
//  Created by Marcus Gubanyi on 10/15/18.
//  Copyright © 2018 CS-CUNE. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Note : NSManagedObject

@property (strong, nonatomic) NSNumber* red;
@property (strong, nonatomic) NSNumber* green;
@property (strong, nonatomic) NSNumber* blue;
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* text;
@property (strong, nonatomic) NSDate* revisedDate;

+ (instancetype)insertNoteWithTitle:(NSString*)title
                               text:(NSString*)text
                                rgb:(NSArray*)rgb
             inManagedObjectContext:(NSManagedObjectContext*)managedObjectContext;

+ (NSString*)entityName;

@end

NS_ASSUME_NONNULL_END
