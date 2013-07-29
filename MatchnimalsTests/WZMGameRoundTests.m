//
//  WZMGamePlayRoundTests.m
//  Matchnimals
//
//  Created by Wojtek on 5/11/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMGameRoundTests.h"
#import "WZMGameRound.h"

@implementation WZMGameRoundTests
{
    WZMGameRound* gamePlayRound;
    
    NSInteger roundNumberFixture;
    NSString* questionImageNameFixture;
    NSArray* answerImageNamesFixture;
    NSInteger correctAnswerNumberFixture;
}

- (void)setUp
{
    roundNumberFixture = 3;
    questionImageNameFixture = @"question image name";
    answerImageNamesFixture = @[@"answer image name 1", @"answer image name 2"];
    correctAnswerNumberFixture = 1;
    
    gamePlayRound = [[WZMGameRound alloc] initWithRoundNumber:roundNumberFixture
                                            questionImageName:questionImageNameFixture
                                             answerImageNames:answerImageNamesFixture
                                          correctAnswerNumber:correctAnswerNumberFixture];
}

- (void)test_that_roundNumber_returns_correct_value
{
    STAssertEquals([gamePlayRound roundNumber], roundNumberFixture, nil);
}

- (void)test_that_questionImageName_returns_correct_value
{
    STAssertEqualObjects([gamePlayRound questionImageName], questionImageNameFixture, nil);
}

- (void)test_that_answerImageNames_returns_correct_value
{
    STAssertEqualObjects([gamePlayRound answerImageNames], answerImageNamesFixture, nil);
}

- (void)test_that_imageNameForAnswer_returns_correct_image_names_indexed_from_one
{
    STAssertEqualObjects([gamePlayRound imageNameForAnswer:1], answerImageNamesFixture[0], nil);
    STAssertEqualObjects([gamePlayRound imageNameForAnswer:2], answerImageNamesFixture[1], nil);
}

- (void)test_that_imageNameForAnswer_throws_exception_when_requested_answer_number_exceeds_number_of_answers
{
    STAssertThrowsSpecificNamed([gamePlayRound imageNameForAnswer:3], NSException, NSRangeException, nil);
}

- (void)test_that_imageNameForAnswer_throws_exception_when_requested_answer_number_is_less_than_one
{
    STAssertThrowsSpecificNamed([gamePlayRound imageNameForAnswer:0], NSException, NSRangeException, nil);
}

- (void)test_that_correctAnswerNumber_returns_correct_value
{
    STAssertEquals([gamePlayRound correctAnswerNumber], correctAnswerNumberFixture, nil);
}

//test that correct answer cannot be out of bounds

@end
