//
//  WZMGameControllerPlistDataSource.m
//  Matchnimals
//
//  Created by Wojtek on 5/31/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMRandomizingGameControllerDataSource.h"
#import "WZMGameRound.h"
#import "WZMArrayHelper.h"

@interface WZMRandomizingGameControllerDataSource ()

@property (nonatomic, retain, readonly) WZMArrayHelper* arrayHelper;
@property (nonatomic, retain, readonly) NSArray* questionAnswerPairs;
@property (nonatomic, readonly) NSInteger numberOfQuestions;
@property (nonatomic, readonly) NSInteger numberOfAnswers;

@end

@implementation WZMRandomizingGameControllerDataSource

- (id)initWithQuestionAnswerPairs:(NSArray*)questionAnswerPairs
                numberOfQuestions:(NSInteger)numberOfQuestions
                  numberOfAnswers:(NSInteger)numberOfAnswers
{
    self = [super init];
    
    if (self) {
        _arrayHelper = [[WZMArrayHelper alloc] init];
        _questionAnswerPairs = questionAnswerPairs;
        _numberOfQuestions = numberOfQuestions;
        _numberOfAnswers = numberOfAnswers;
    }
    
    return self;
}

- (NSArray*)roundsForNewGame
{
    NSArray* randomizedQuestionAnswerPairs = [self.arrayHelper shuffleArray:self.questionAnswerPairs];

    NSArray* correctQuestionAnswerPairs = [self.arrayHelper first:self.numberOfQuestions objectsFromArray:randomizedQuestionAnswerPairs];
    NSArray* wrongQuestionAnswerPairsPool = [self.arrayHelper allButFirst:self.numberOfQuestions objectsFromArray:randomizedQuestionAnswerPairs];
    
    NSArray* rounds = [self.arrayHelper mapArray:correctQuestionAnswerPairs withBlock:^id(NSArray* correctQuestionAnswerPair) {
        NSString* questionImageName = correctQuestionAnswerPair[0];
        NSString* correctAnswerImageName = correctQuestionAnswerPair[1];
        
        NSArray* randomizedWrongQuestionAnswerPairs = [self.arrayHelper shuffleArray:wrongQuestionAnswerPairsPool];

        NSArray* selectedWrongQuestionAnswerPairs = [self.arrayHelper first:(self.numberOfAnswers - 1) objectsFromArray:randomizedWrongQuestionAnswerPairs];
        NSArray* wrongAnswerImageNames = [self.arrayHelper mapArray:selectedWrongQuestionAnswerPairs withBlock:^id(NSArray* wrongQuestionAnswerPair) {
            return wrongQuestionAnswerPair[1];
        }];
        
        NSArray* answerImageNames = [@[correctAnswerImageName] arrayByAddingObjectsFromArray:wrongAnswerImageNames];
        NSArray* randomizedAnswerImageNames = [self.arrayHelper shuffleArray:answerImageNames];
        
        NSInteger correctAnswerNumber = [randomizedAnswerImageNames indexOfObject:correctAnswerImageName] + 1;
        
        return [[WZMGameRound alloc] initWithQuestionImageName:questionImageName answerImageNames:randomizedAnswerImageNames correctAnswerNumber:correctAnswerNumber];
    }];
    
    return rounds;
}

#pragma mark - private methods

- (NSArray*)randomizedQuestionAnswerPairs
{
    return [self.arrayHelper shuffleArray:self.questionAnswerPairs];
}

@end
