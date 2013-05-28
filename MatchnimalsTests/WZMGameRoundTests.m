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
    
    NSString* questionImageNameFixture;
    NSArray* answersImageNamesFixture;
    NSInteger correctAnswerNumberFixture;
}

- (void)setUp
{
    questionImageNameFixture = @"question image name";
    answersImageNamesFixture = @[@"answer image name 1", @"answer image name 2"];
    correctAnswerNumberFixture = 1;
    
    gamePlayRound = [[WZMGameRound alloc] initWithQuestionImageName:questionImageNameFixture
                                              answersImageNames:answersImageNamesFixture
                                            correctAnswerNumber:correctAnswerNumberFixture];
}

- (void)test_that_questionImageName_returns_correct_value
{
    STAssertEqualObjects([gamePlayRound imageNameForQuestion], questionImageNameFixture, nil);
}

- (void)test_that_imageNameForAnswer_returns_correct_image_names_indexed_from_one
{
    STAssertEqualObjects([gamePlayRound imageNameForAnswer:1], answersImageNamesFixture[0], nil);
    STAssertEqualObjects([gamePlayRound imageNameForAnswer:2], answersImageNamesFixture[1], nil);
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
