//
//  WZMGamePlayRound.m
//  Matchnimals
//
//  Created by Wojtek on 5/11/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMGameRound.h"

@implementation WZMGameRound
{
    NSArray* _answersImageNames;
    int _correctAnswerNumber;
}

- (id)initWithQuestionImageName:(NSString*)questionImageName
              answersImageNames:(NSArray*)answersImageNames
            correctAnswerNumber:(NSInteger)correctAnswerNumber
{
    self = [super init];
    
    if (self) {
        _imageNameForQuestion = questionImageName;
        _answersImageNames = answersImageNames;
        _correctAnswerNumber = correctAnswerNumber;
    }
    
    return self;
}

- (NSString*)imageNameForAnswer:(NSInteger)answerNumber
{
    return _answersImageNames[answerNumber - 1];
}

- (BOOL)isAnswerCorrect:(NSInteger)answerNumber
{
    return (answerNumber == _correctAnswerNumber);
}

@end
