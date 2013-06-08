//
//  WZMArrayRandomizer.m
//  Matchnimals
//
//  Created by Wojtek on 5/28/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMArrayHelper.h"

@implementation WZMArrayHelper

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

- (NSArray*)first:(NSInteger)numberOfObjectsToReturn objectsFromArray:(NSArray*)array
{
    NSRange selectedRange;
    
    selectedRange.location = 0;
    selectedRange.length = numberOfObjectsToReturn;
    
    return [array subarrayWithRange:selectedRange];
}

- (NSArray*)allButFirst:(NSInteger)numberOfObjectsToSkip objectsFromArray:(NSArray*)array
{
    NSRange selectedRange;
    
    selectedRange.location = numberOfObjectsToSkip;
    selectedRange.length = [array count] - numberOfObjectsToSkip;
    
    return [array subarrayWithRange:selectedRange];
}

- (NSArray*)mapArray:(NSArray*)array withBlock:(id (^)(id))block
{
    NSMutableArray* mappedArray = [NSMutableArray array];
    
    for (id obj in array) {
        [mappedArray addObject:block(obj)];
    }
    
    return [NSArray arrayWithArray: mappedArray];
}

@end
