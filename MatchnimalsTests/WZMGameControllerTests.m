//
//  WZMGameControllerTests.m
//  Matchnimals
//
//  Created by Wojtek on 5/27/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMGameControllerTests.h"
#import "OCMock.h"
#import "WZMGameRound.h"
#import "WZMGameController.h"

@implementation WZMGameControllerTests
{
    WZMGameRound* round1;
    WZMGameRound* round2;
        
    id dataSourceMock;
    id delegateMock;
    
    WZMGameController* controller;
}

- (void)setUp
{
    round1 = [[WZMGameRound alloc] initWithQuestionImageName:@"q1"
                                           answersImageNames:@[@"a11", @"a12", @"a13"]
                                         correctAnswerNumber:1];
    
    round2 = [[WZMGameRound alloc] initWithQuestionImageName:@"q2"
                                           answersImageNames:@[@"a21", @"a22", @"a23"]
                                         correctAnswerNumber:2];
 
    dataSourceMock = [OCMockObject mockForProtocol:@protocol(WZMGameControllerDataSource)];
    delegateMock = [OCMockObject mockForProtocol:@protocol(WZMGameControllerDelegate)];
    [delegateMock setExpectationOrderMatters:YES];
    
    controller = [[WZMGameController alloc] init];
    controller.dataSource = dataSourceMock;
    controller.delegate = delegateMock;
}

#pragma mark - tests

- (void)test_that_game_can_be_finished_when_all_answers_are_correct
{
    [[[dataSourceMock stub] andReturn:@[round1, round2]] roundsForNewGame];
    
    [[delegateMock expect] newRound:round1];
    [[delegateMock expect] newRound:round2];
    [[delegateMock expect] gameCompleted];
    
    [controller startNewGame];
    [controller giveAnswerWithNumber:1];
    [controller giveAnswerWithNumber:2];
    
    [delegateMock verify];
}

- (void)test_that_wrong_answer_does_not_advance_round
{
    [[[dataSourceMock stub] andReturn:@[round1, round2]] roundsForNewGame];
    
    [[delegateMock expect] newRound:round1];
    [[delegateMock expect] wrongAnswer:3];
    [[delegateMock expect] newRound:round2];
    
    [controller startNewGame];
    [controller giveAnswerWithNumber:3];
    [controller giveAnswerWithNumber:1];
    
    [delegateMock verify];
}

- (void)test_that_wrong_answer_does_not_finish_game
{
    [[[dataSourceMock stub] andReturn:@[round1, round2]] roundsForNewGame];
    
    [[delegateMock expect] newRound:round1];
    [[delegateMock expect] newRound:round2];
    [[delegateMock expect] wrongAnswer:3];
    
    [controller startNewGame];
    [controller giveAnswerWithNumber:1];
    [controller giveAnswerWithNumber:3];
    
    [delegateMock verify];
}

- (void)test_that_restarting_game_for_the_second_time_reloads_data_from_the_data_source
{
    [[[dataSourceMock expect] andReturn:@[round2]] roundsForNewGame];
    [[[dataSourceMock expect] andReturn:@[round1]] roundsForNewGame];
    
    [[delegateMock expect] newRound:round2];
    [[delegateMock expect] newRound:round1];
    
    [controller startNewGame];
    [controller startNewGame];
    
    [delegateMock verify];
}

- (void)test_that_exception_is_thrown_when_trying_to_answer_without_starting_new_game_first
{
    STAssertThrowsSpecificNamed([controller giveAnswerWithNumber:1], NSException, NSGenericException, nil);
}

@end
