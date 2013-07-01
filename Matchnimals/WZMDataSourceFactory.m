//
//  WZMDataSourceFactory.m
//  Matchnimals
//
//  Created by Wojtek on 6/27/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMDataSourceFactory.h"
#import "WZMPlistDataReader.h"
#import "WZMRandomizingGameControllerDataSource.h"

@implementation WZMDataSourceFactory

+ (id<WZMGameControllerDataSource>)dataSourceForLevel:(NSInteger)levelNumber
{
    NSArray* questionAnswerPairs = [[WZMPlistDataReader sharedInstance] questionAnswerPairsForLevel:levelNumber];
    return [[WZMRandomizingGameControllerDataSource alloc] initWithQuestionAnswerPairs:questionAnswerPairs numberOfQuestions:6 numberOfAnswers:3];
}

@end
