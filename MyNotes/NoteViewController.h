//
//  NoteViewController.h
//  MyNotes
//
//  Created by Marcus Gubanyi on 10/15/18.
//  Copyright © 2018 CS-CUNE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class Note;

@interface NoteViewController : UIViewController

@property (strong, nonatomic) Note* note;

-(void)saveNote;

@end

NS_ASSUME_NONNULL_END
