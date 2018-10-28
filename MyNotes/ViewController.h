//
//  ViewController.h
//  MyNotes
//
//  Created by Marcus Gubanyi on 10/15/18.
//  Copyright © 2018 CS-CUNE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) NSManagedObjectContext *notesManagedObjectContext;

@end

