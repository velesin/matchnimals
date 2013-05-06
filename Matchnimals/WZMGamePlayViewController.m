//
//  WZMGamePlayViewController.m
//  Matchnimals
//
//  Created by Wojtek on 4/23/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMGamePlayViewController.h"

@interface WZMGamePlayViewController ()

@end

@implementation WZMGamePlayViewController

- (IBAction)playAgain:(UIStoryboardSegue *)unwindSegue
{

}

- (IBAction)answer:(id)sender
{
    [self performSegueWithIdentifier:@"GameWin" sender:sender];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
