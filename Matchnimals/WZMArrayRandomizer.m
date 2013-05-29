//
//  WZMArrayRandomizer.m
//  Matchnimals
//
//  Created by Wojtek on 5/28/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMArrayRandomizer.h"

@implementation WZMArrayRandomizer

- (NSArray*)shuffleArray:(NSArray*)array
{
    NSMutableArray* tmpArray = [NSMutableArray arrayWithArray:array];
    
    NSInteger lastElementIndex = [tmpArray count] - 1;
    for (NSInteger currentIndex = lastElementIndex; currentIndex > 0; currentIndex--) {
        NSInteger indexToSwapWith = [self randomNumberInclusiveBetweenZeroAnd:currentIndex];
        [tmpArray exchangeObjectAtIndex:currentIndex withObjectAtIndex:indexToSwapWith];
    }
    
    return [NSArray arrayWithArray:tmpArray];
}

- (NSInteger)randomNumberInclusiveBetweenZeroAnd:(NSInteger)max
{
    return arc4random_uniform(max + 1);
}

@end
