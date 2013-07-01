//
//  WZMGamePlayViewController.m
//  Matchnimals
//
//  Created by Wojtek on 4/23/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMGamePlayViewController.h"
#import "WZMGameRound.h"
#import "WZMGameController.h"

@interface WZMGamePlayViewController ()

@end

@implementation WZMGamePlayViewController
{
    IBOutlet UIImageView* _questionImageView;
    IBOutlet UIImageView* _answer1ImageView;
    IBOutlet UIImageView* _answer2ImageView;
    IBOutlet UIImageView* _answer3ImageView;
    
    NSArray* _rounds;
    NSInteger _currentRoundNumber;
}

- (IBAction)playAgain:(UIStoryboardSegue *)unwindSegue
{

}

- (IBAction)answer:(id)sender
{
    if ([[self currentRound] correctAnswerNumber] == [sender tag]) {
        _currentRoundNumber += 1;
        [self setImagesForCurrentRound];
    }
//    [self performSegueWithIdentifier:@"GameWin" sender:sender];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _rounds = [self.dataSource drawNewSetOfRounds];
    _currentRoundNumber = 1;

    [self setImagesForCurrentRound];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage*)imageNamed:(NSString*)imageName
{
    NSString* imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg" inDirectory:@"Images"];
    return [UIImage imageWithContentsOfFile:imagePath];
}

- (WZMGameRound*)currentRound
{
    return _rounds[_currentRoundNumber - 1];
}

- (void)setImagesForCurrentRound
{
    WZMGameRound* currentRound = [self currentRound];
    
    _questionImageView.image = [self imageNamed:[currentRound questionImageName]];
    _answer1ImageView.image = [self imageNamed:[currentRound imageNameForAnswer:1]];
    _answer2ImageView.image = [self imageNamed:[currentRound imageNameForAnswer:2]];
    _answer3ImageView.image = [self imageNamed:[currentRound imageNameForAnswer:3]];
}

@end
