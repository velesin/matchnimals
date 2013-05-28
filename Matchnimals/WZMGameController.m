//
//  WZMGameController.m
//  Matchnimals
//
//  Created by Wojtek on 5/27/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMGameController.h"
#import "WZMGameRound.h"

@implementation WZMGameController {
    NSArray* _rounds;
    NSInteger _currentRoundNumber;
}

- (void)startNewGame
{
    _rounds = [self.dataSource roundsForNewGame];
    _currentRoundNumber = 1;
    
    [self.delegate newRound:[self currentRound]];
}

- (void)giveAnswerWithNumber:(NSInteger)answerNumber
{
    if (!_rounds) {
        @throw [NSException
                exceptionWithName:NSGenericException
                reason:@"You must startNewGame before trying to giveAnswerWithNumber"
                userInfo:nil];
    }
    
    if ([[self currentRound] correctAnswerNumber] != answerNumber) {
        [self.delegate wrongAnswer:answerNumber];
        return;
    }
    
    if ([self isLastRound]) {
        [self.delegate gameCompleted];
        return;
    }
    
    _currentRoundNumber += 1;
    [self.delegate newRound:[self currentRound]];
}

#pragma mark - private methods

- (BOOL)isLastRound
{
    return _currentRoundNumber == [_rounds count];
}

- (WZMGameRound*)currentRound
{
    return _rounds[_currentRoundNumber - 1];
}

@end
