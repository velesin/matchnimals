//
//  WZMGamePlayRound.m
//  Matchnimals
//
//  Created by Wojtek on 5/11/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMGameRound.h"

@implementation WZMGameRound

- (id)initWithQuestionImageName:(NSString*)questionImageName
              answerImageNames:(NSArray*)answerImageNames
            correctAnswerNumber:(NSInteger)correctAnswerNumber
{
    self = [super init];
    
    if (self) {
        _questionImageName = questionImageName;
        _answerImageNames = answerImageNames;
        _correctAnswerNumber = correctAnswerNumber;
    }
    
    return self;
}

- (NSString*)imageNameForAnswer:(NSInteger)answerNumber
{
    return self.answerImageNames[answerNumber - 1];
}

@end
