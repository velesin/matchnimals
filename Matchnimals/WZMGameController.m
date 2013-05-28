//
//  WZMGameController.m
//  Matchnimals
//
//  Created by Wojtek on 5/27/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMGameController.h"

@implementation WZMGameController {
    NSArray* _rounds;
}

- (void)startNewGame
{
    _rounds = [self.dataSource roundsForNewGame];
    [self.delegate newRound:_rounds[0]];
}

- (void)giveAnswerWithNumber:(NSInteger)answerNumber
{
    [self.delegate newRound:_rounds[1]];
}

@end
