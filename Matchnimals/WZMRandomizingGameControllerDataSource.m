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
        _questionAnswerPairs = questionAnswerPairs;
        _numberOfQuestions = numberOfQuestions;
        _numberOfAnswers = numberOfAnswers;
    }
    
    return self;
}

- (NSArray*)roundsForNewGame
{
    WZMArrayHelper* arrayHelper = [WZMArrayHelper sharedInstance];
    
    NSArray* randomizedQuestionAnswerPairs = [arrayHelper shuffleArray:self.questionAnswerPairs];

    NSArray* correctQuestionAnswerPairs = [arrayHelper first:self.numberOfQuestions objectsFromArray:randomizedQuestionAnswerPairs];
    NSArray* wrongQuestionAnswerPairsPool = [arrayHelper allButFirst:self.numberOfQuestions objectsFromArray:randomizedQuestionAnswerPairs];
    
    NSArray* rounds = [arrayHelper mapArray:correctQuestionAnswerPairs withBlock:^id(NSArray* correctQuestionAnswerPair) {
        NSString* questionImageName = correctQuestionAnswerPair[0];
        NSString* correctAnswerImageName = correctQuestionAnswerPair[1];
        
        NSArray* randomizedWrongQuestionAnswerPairs = [arrayHelper shuffleArray:wrongQuestionAnswerPairsPool];

        NSArray* selectedWrongQuestionAnswerPairs = [arrayHelper first:(self.numberOfAnswers - 1) objectsFromArray:randomizedWrongQuestionAnswerPairs];
        NSArray* wrongAnswerImageNames = [arrayHelper mapArray:selectedWrongQuestionAnswerPairs withBlock:^id(NSArray* wrongQuestionAnswerPair) {
            return wrongQuestionAnswerPair[1];
        }];
        
        NSArray* answerImageNames = [@[correctAnswerImageName] arrayByAddingObjectsFromArray:wrongAnswerImageNames];
        NSArray* randomizedAnswerImageNames = [arrayHelper shuffleArray:answerImageNames];
        
        NSInteger correctAnswerNumber = [randomizedAnswerImageNames indexOfObject:correctAnswerImageName] + 1;
        
        return [[WZMGameRound alloc] initWithQuestionImageName:questionImageName answerImageNames:randomizedAnswerImageNames correctAnswerNumber:correctAnswerNumber];
    }];
    
    return rounds;
}

@end
