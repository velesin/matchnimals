//
//  WZMGameControllerPlistDataSourceTests.m
//  Matchnimals
//
//  Created by Wojtek on 5/31/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMRandomizingGameControllerDataSourceTests.h"
#import "OCMock.h"
#import "WZMGameRound.h"
#import "WZMArrayHelper.h"
#import "WZMRandomizingGameControllerDataSource.h"


@interface WZMRandomizingGameControllerDataSourceMock : WZMRandomizingGameControllerDataSource

@property (nonatomic, retain) WZMArrayHelper* arrayHelper;

@end

@implementation WZMRandomizingGameControllerDataSourceMock @end


@implementation WZMRandomizingGameControllerDataSourceTests
{
    NSArray* questionAnswerPairs;
    id arrayHelperMock;
    WZMRandomizingGameControllerDataSourceMock* dataSource;
}

- (void)setUp
{
    questionAnswerPairs = @[
                            @[@"q1", @"a1"],
                            @[@"q2", @"a2"],
                            @[@"q3", @"a3"],
                            @[@"q4", @"a4"],
                            @[@"q5", @"a5"],
                            ];
    
    WZMArrayHelper* arrayHelper = [[WZMArrayHelper alloc] init];
    arrayHelperMock = [OCMockObject partialMockForObject:arrayHelper];
}

- (void)test_that_data_source_builds_and_sorts_rounds_properly_when_helper_always_returns_identical_array
{
    dataSource = [[WZMRandomizingGameControllerDataSourceMock alloc] initWithQuestionAnswerPairs:questionAnswerPairs numberOfQuestions:2 numberOfAnswers:3];
    dataSource.arrayHelper = arrayHelperMock;
    
    [[[arrayHelperMock stub] andCall:@selector(returnIdenticalArray:) onObject:self] shuffleArray:[OCMArg any]];
    
    NSArray* expectedRoundsArrayRepresentation = @[
                                                   @[@"q1", @[@"a1", @"a3", @"a4"], @1],
                                                   @[@"q2", @[@"a2", @"a3", @"a4"], @1],
                                                   ];
    NSArray* actualRoundsArrayRepresentation = [self arrayRepresentationForRounds:[dataSource roundsForNewGame]];
    
    STAssertEqualObjects(actualRoundsArrayRepresentation, expectedRoundsArrayRepresentation, nil);
}

- (void)test_that_data_source_builds_and_sorts_rounds_properly_when_helper_always_returns_reversed_array
{
    dataSource = [[WZMRandomizingGameControllerDataSourceMock alloc] initWithQuestionAnswerPairs:questionAnswerPairs numberOfQuestions:2 numberOfAnswers:3];
    dataSource.arrayHelper = arrayHelperMock;
    
    [[[arrayHelperMock stub] andCall:@selector(returnReversedArray:) onObject:self] shuffleArray:[OCMArg any]];
    
    NSArray* expectedRoundsArrayRepresentation = @[
                                                   @[@"q5", @[@"a2", @"a1", @"a5"], @3],
                                                   @[@"q4", @[@"a2", @"a1", @"a4"], @3],
                                                   ];
    NSArray* actualRoundsArrayRepresentation = [self arrayRepresentationForRounds:[dataSource roundsForNewGame]];
    
    STAssertEqualObjects(actualRoundsArrayRepresentation, expectedRoundsArrayRepresentation, nil);
}

- (void)test_that_data_source_respects_number_of_questions_and_number_of_answers_params
{
    dataSource = [[WZMRandomizingGameControllerDataSourceMock alloc] initWithQuestionAnswerPairs:questionAnswerPairs numberOfQuestions:3 numberOfAnswers:2];
    dataSource.arrayHelper = arrayHelperMock;
    
    [[[arrayHelperMock stub] andCall:@selector(returnIdenticalArray:) onObject:self] shuffleArray:[OCMArg any]];
    
    NSArray* expectedRoundsArrayRepresentation = @[
                                                   @[@"q1", @[@"a1", @"a4"], @1],
                                                   @[@"q2", @[@"a2", @"a4"], @1],
                                                   @[@"q3", @[@"a3", @"a4"], @1],
                                                   ];
    NSArray* actualRoundsArrayRepresentation = [self arrayRepresentationForRounds:[dataSource roundsForNewGame]];
    
    STAssertEqualObjects(actualRoundsArrayRepresentation, expectedRoundsArrayRepresentation, nil);
}

#pragma mark - mock helper methods
     
- (NSArray*)returnIdenticalArray:(NSArray*)array
{
    return array;
}

- (NSArray*)returnReversedArray:(NSArray*)array
{
    return [[array reverseObjectEnumerator] allObjects];
}

- (NSArray*)arrayRepresentationForRounds:(NSArray*)rounds
{
    NSMutableArray* arrayRepresentation = [NSMutableArray array];
    
    for (WZMGameRound* round in rounds) {
        [arrayRepresentation addObject:@[
         [round questionImageName],
         [round answerImageNames],
         [NSNumber numberWithInteger:[round correctAnswerNumber]],
         ]];
    }
         
    return arrayRepresentation;
}

@end
