//
//  WZMGamePlayRound.h
//  Matchnimals
//
//  Created by Wojtek on 5/11/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZMGameRound : NSObject

@property (readonly) NSString* imageNameForQuestion;
@property (readonly) NSInteger correctAnswerNumber;

- (id)initWithQuestionImageName:(NSString*)questionImageName
              answersImageNames:(NSArray*)answersImageNames
            correctAnswerNumber:(NSInteger)correctAnswerNumber;

- (NSString*)imageNameForAnswer:(NSInteger)answerNumber;

@end
