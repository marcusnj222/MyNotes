//
//  NoteViewController.m
//  MyNotes
//
//  Created by Marcus Gubanyi on 10/15/18.
//  Copyright © 2018 CS-CUNE. All rights reserved.
//

#import "NoteViewController.h"
#import "Note.h"
#import "ColorViewController.h"

@interface NoteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation NoteViewController

- (void)viewDidLoad {
    //Always call super before anything else
    [super viewDidLoad];

    // Initialize properties of the field before
    [[self titleField] setText:[[self note] title]];
    [[self textView] setText:[[self note] text]];
    UIColor *background = [UIColor colorWithRed:self.note.red.doubleValue
                                          green:self.note.green.doubleValue
                                           blue:self.note.blue.doubleValue
                                          alpha:1];
    
    [[self view] setBackgroundColor:background];
}

- (IBAction)unwind:(UIStoryboardSegue*)unwindSegue
{
    [[self view] setBackgroundColor:[(ColorViewController*)[unwindSegue sourceViewController] chosenColor]];
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    // Before we go back, we save the data into the note object stored in the managedObjectContext
    if ([[segue identifier] isEqualToString:@"Back"])
    {
        [self saveNote];
    }
    else if ([[segue destinationViewController] isKindOfClass:[ColorViewController class]])
    {
        [(ColorViewController*)[segue destinationViewController] setChosenColor:[[self view] backgroundColor]];
    }
}

- (void)saveNote
{
    [[self note] setText:[[self textView] text]];
    [[self note] setTitle:[[self titleField] text]];
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    [[[self view] backgroundColor] getRed:&red green:&green blue:&blue alpha:nil];
    [[self note] setRed:[NSNumber numberWithDouble:red]];
    [[self note] setGreen:@(green)];
    [[self note] setBlue:@(blue)];
    [[self note] setRevisedDate:[NSDate date]];
}

@end
