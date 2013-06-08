//
//  WZMGameControllerPlistDataSource.h
//  Matchnimals
//
//  Created by Wojtek on 5/31/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZMGameControllerDataSource.h"

@interface WZMRandomizingGameControllerDataSource : NSObject <WZMGameControllerDataSource>

- (id)initWithQuestionAnswerPairs:(NSArray*)questionAnswerPairs
                numberOfQuestions:(NSInteger)numberOfQuestions
                  numberOfAnswers:(NSInteger)numberOfAnswers;

@end
