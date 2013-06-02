//
//  WZMGameControllerPlistDataSourceTests.m
//  Matchnimals
//
//  Created by Wojtek on 5/31/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMGameControllerPlistDataSourceTests.h"
#import "OCMock.h"
#import "WZMGameRound.h"
#import "WZMGameControllerPlistDataSource.h"

@implementation WZMGameControllerPlistDataSourceTests

- (void)test_that_data_source_builds_and_sorts_rounds_properly
{
    WZMGameRound* round1 = [[WZMGameRound alloc] initWithQuestionImageName:@""
                                                         answersImageNames:@[@"", @"", @""]
                                                       correctAnswerNumber:1];
    
    WZMGameRound* round2 = [[WZMGameRound alloc] initWithQuestionImageName:@""
                                                         answersImageNames:@[@"", @"", @""]
                                                       correctAnswerNumber:1];
    
    NSArray* expectedRounds = @[round1, round2];
    
    STFail(@"unfinished test");
}

@end
