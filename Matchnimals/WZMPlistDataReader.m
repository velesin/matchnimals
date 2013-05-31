//
//  WZMPlistDataReader.m
//  Matchnimals
//
//  Created by Wojtek on 5/30/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMPlistDataReader.h"

@implementation WZMPlistDataReader
{
    NSArray* _levelsPlist;
}

- (NSArray*)questionAnswerPairsForLevel:(NSInteger)levelNumber
{
    return [self levelsPlist][levelNumber - 1];
}

- (NSArray*)levelsPlist
{
    if (!_levelsPlist) {
        NSString* levelsPlistPath = [[NSBundle mainBundle] pathForResource:@"Levels" ofType:@"plist"];
        _levelsPlist = [NSArray arrayWithContentsOfFile:levelsPlistPath];
    }
    return _levelsPlist;
}

@end
