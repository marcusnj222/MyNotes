//
//  ColorViewController.m
//  MyNotes
//
//  Created by Marcus Gubanyi on 10/28/18.
//  Copyright © 2018 CS-CUNE. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()

@end


@implementation ColorViewController
@synthesize chosenColor;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)colorPicked:(UIButton*)sender
{
    [self setChosenColor:[sender backgroundColor]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
