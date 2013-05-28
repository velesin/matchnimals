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

@implementation WZMGameControllerGameNotYetStartedTests
{
    @protected
    id dataSourceMock;
    id delegateMock;
    
    WZMGameRound* round1;
    WZMGameRound* round2;
    WZMGameRound* round3;    
    
    WZMGameController* controller;
}

- (void)setUp
{
    dataSourceMock = [OCMockObject mockForProtocol:@protocol(WZMGameControllerDataSource)];
    delegateMock = [OCMockObject mockForProtocol:@protocol(WZMGameControllerDelegate)];
    
    NSArray* round1AnswerImageNames = @[@"a11", @"a12", @"a13"];
    round1 = [[WZMGameRound alloc] initWithQuestionImageName:@"q1"
                                           answersImageNames:round1AnswerImageNames
                                         correctAnswerNumber:1];
    
    NSArray* round2AnswerImageNames = @[@"a21", @"a22", @"a23"];
    round2 = [[WZMGameRound alloc] initWithQuestionImageName:@"q2"
                                           answersImageNames:round2AnswerImageNames
                                         correctAnswerNumber:3];
    
    [[[dataSourceMock stub] andReturn:@[round1, round2]] roundsForNewGame];
    
    controller = [[WZMGameController alloc] init];
    controller.dataSource = dataSourceMock;
    controller.delegate = delegateMock;
}

#pragma mark - tests

- (void)test_that_controller_passes_first_round_to_delegate_newRound_when_newGame_is_called
{
    [[delegateMock expect] newRound:round1];
    
    [controller startNewGame];
    
    [delegateMock verify];
}

//- (void)test_that_exception_is_thrown_when_trying_to_give_answer_without_invoking_startNewGame_first
//{
//    STAssertThrowsSpecificNamed([controller giveAnswerWithNumber:1], NSException, NSInternalInconsistencyException, nil);
//}

//- (void)test_that_controller_obtains_new_set_of_rounds_from_data_source_when_newGame_is_called
//{
//    
//}

@end

//@implementation WZMGameControllerGameStartedAndTheRoundIsNotTheLastOneTests
//
//- (void)setUp
//{
//    [super setUp];
//    
//    [controller startNewGame];
//}
//
//- (void)test_that_when_correct_answer_is_given_delegate_newRound_method_is_called_with_the_next_round
//{
//    //    [delegateMock setExpectationOrderMatters:YES];
//    //    [[delegateMock expect] newRound:round1];
//    
////    [[delegateMock stub] newRound:round1];
//    
////    [controller startNewGame];
//    [[delegateMock expect] newRound:round1];
//    [controller giveAnswerWithNumber:1];
//    
//    [delegateMock verify];
//}
//
//@end
//
//@implementation WZMGameControllerGameIsOnTheSecondRound
//
//- (void)setUp
//{
//    [controller giveAnswerWithNumber:1];
//}
//
//@end
