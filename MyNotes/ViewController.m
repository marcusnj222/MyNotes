//
//  ViewController.m
//  MyNotes
//
//  Created by Marcus Gubanyi on 10/15/18.
//  Copyright © 2018 CS-CUNE. All rights reserved.
//

#import "ViewController.h"
#import "Note.h"
#import "NoteViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *noteCollectionView;
@property (strong, nonatomic) NSArray *cachedNotes;
@property (nonatomic) BOOL needToFetchNotes;

@end

@implementation ViewController

@synthesize notesManagedObjectContext;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //When the view loads - make sure to set to YES so that it will fetch from persistent data.
    [self setNeedToFetchNotes:YES];
}

// This function is an IBAction which will be called when we segue back to this view controller. It is set up with the Exit action on a storyboard.
- (IBAction)unwind:(UIStoryboardSegue*)unwindSegue
{
    [[self noteCollectionView] reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"AddNote"])
    {
        Note* note = [Note insertNoteWithTitle:@""
                                          text:@""
                                           rgb:@[@0.7843,@0.7843,@0.7843]
                        inManagedObjectContext:[self notesManagedObjectContext]];
        
        [(NoteViewController*)[segue destinationViewController] setNote:note];
        
    }else if ([[segue identifier] isEqualToString:@"EditNote"])
    {
        NSInteger index = [[[self noteCollectionView] indexPathForCell:(UICollectionViewCell*)sender] indexAtPosition:1];
        Note* selectedNote = [[self notes] objectAtIndex:index];
        
        [(NoteViewController*)[segue destinationViewController] setNote:selectedNote];
    }
    [self setNeedToFetchNotes:YES];
}

- (NSArray*)notes
{
    if (![self needToFetchNotes])
    {
        return [self cachedNotes];
    } else
    {
        // To access data from a managed object context, you need to execute a fetch request
        NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Note"];
        
        NSArray* notes = [[self.notesManagedObjectContext executeFetchRequest:request error:NULL] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2)
                          {
                              Note *note1 = obj1;
                              Note *note2 = obj2;
                              return [note2.revisedDate compare:note1.revisedDate];
                          }];
        
        [self setCachedNotes:notes];
        [self setNeedToFetchNotes:NO];
        return notes;
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return [[self notes] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NoteCell" forIndexPath:indexPath];
    
    Note* noteForCell = [[self notes] objectAtIndex:[indexPath indexAtPosition:1]];
    
    [cell setBackgroundColor:[UIColor colorWithRed:[[noteForCell red] doubleValue]
                                             green:[[noteForCell green] doubleValue]
                                              blue:[[noteForCell blue] doubleValue]
                                             alpha:1.0]];
    UILabel* cellLabel = (UILabel*)[[[[cell subviews] objectAtIndex:0] subviews] objectAtIndex:0];
    
    [cellLabel setText:[noteForCell title]];
    
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((CGRectGetWidth(collectionView.frame)-40)/3, (CGRectGetWidth(collectionView.frame)-40)/3);
}


@end
