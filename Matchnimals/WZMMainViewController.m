//
//  WZMViewController.m
//  Matchnimals
//
//  Created by Wojtek on 4/14/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMMainViewController.h"

@interface WZMMainViewController ()

@end

@implementation WZMMainViewController

- (IBAction)unwindToMain:(UIStoryboardSegue *)unwindSegue {}

- (IBAction)selectLevel:(id)sender
{
    [self performSegueWithIdentifier:@"GamePlay" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
