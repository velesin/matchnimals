//
//  WZMArrayRandomizerTests.m
//  Matchnimals
//
//  Created by Wojtek on 5/28/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMArrayRandomizerTests.h"
#import "OCMock.h"
#import "WZMArrayRandomizer.h"

@interface WZMArrayRandomizerMock : WZMArrayRandomizer

@property (copy) NSInteger(^fakeRandomNumberMethod)(NSInteger);

@end

@implementation WZMArrayRandomizerMock

- (NSInteger)randomNumberInclusiveBetweenZeroAnd:(NSInteger)max
{
    return self.fakeRandomNumberMethod(max);
}

@end

@implementation WZMArrayRandomizerTests
{
    NSArray* originalArray;
    WZMArrayRandomizerMock* randomizerMock;
}

- (void)setUp
{
    originalArray = @[@"a", @"b", @"c", @"d"];
    randomizerMock = [[WZMArrayRandomizerMock alloc] init];
}

- (void)test_that_array_is_shuffled_correctly_when_random_number_generator_always_returns_zero
{
    randomizerMock.fakeRandomNumberMethod = ^(NSInteger max) {
        return 0;
    };
    
    NSArray* shuffledArray = [randomizerMock shuffleArray:originalArray];
    
    NSArray* expectedArray = @[@"b", @"c", @"d", @"a"];
    STAssertEqualObjects(shuffledArray, expectedArray, nil);
}

- (void)test_that_array_is_shuffled_correctly_when_random_number_generator_always_returns_one
{
    randomizerMock.fakeRandomNumberMethod = ^(NSInteger max) {
        return 1;
    };
    
    NSArray* shuffledArray = [randomizerMock shuffleArray:originalArray];
    
    NSArray* expectedArray = @[@"a", @"c", @"d", @"b"];
    STAssertEqualObjects(shuffledArray, expectedArray, nil);
}

- (void)test_that_array_is_shuffled_correctly_when_random_number_generator_always_returns_max
{
    randomizerMock.fakeRandomNumberMethod = ^(NSInteger max) {
        return max;
    };
    
    NSArray* shuffledArray = [randomizerMock shuffleArray:originalArray];
    
    NSArray* expectedArray = @[@"a", @"b", @"c", @"d"];
    STAssertEqualObjects(shuffledArray, expectedArray, nil);
}

- (void)test_that_array_is_shuffled_correctly_when_random_number_generator_always_returns_max_minus_one
{
    randomizerMock.fakeRandomNumberMethod = ^(NSInteger max) {
        return max - 1;
    };
    
    NSArray* shuffledArray = [randomizerMock shuffleArray:originalArray];
    
    NSArray* expectedArray = @[@"d", @"a", @"b", @"c"];
    STAssertEqualObjects(shuffledArray, expectedArray, nil);
}

@end
