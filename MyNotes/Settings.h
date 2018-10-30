//
//  Settings.h
//  MyNotes
//
//  Created by Marcus Gubanyi on 10/29/18.
//  Copyright © 2018 CS-CUNE. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Settings : NSObject

+ (NSSortDescriptor*)noteSortDescriptor;
+ (void)setNoteSortDescriptorWithKey:(NSString*) key;
+ (NSArray*)noteSortDescriptorOptions;

@end

NS_ASSUME_NONNULL_END
