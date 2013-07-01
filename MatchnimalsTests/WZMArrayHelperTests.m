//
//  WZMArrayRandomizerTests.m
//  Matchnimals
//
//  Created by Wojtek on 5/28/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMArrayHelperTests.h"
#import "OCMock.h"
#import "WZMArrayHelper.h"

@interface WZMArrayHelperMock : WZMArrayHelper

@property (copy) NSInteger(^fakeRandomNumberMethod)(NSInteger);

@end

@implementation WZMArrayHelperMock

- (NSInteger)randomNumberInclusiveBetweenZeroAnd:(NSInteger)max
{
    return self.fakeRandomNumberMethod(max);
}

@end

@implementation WZMArrayHelperTests
{
    NSArray* originalArray;
    WZMArrayHelperMock* helperMock;
}

- (void)setUp
{
    originalArray = @[@"a", @"b", @"c", @"d"];
    helperMock = [[WZMArrayHelperMock alloc] init];
}

- (void)test_that_array_is_shuffled_correctly_when_random_number_generator_always_returns_zero
{
    helperMock.fakeRandomNumberMethod = ^(NSInteger max) {
        return 0;
    };
    
    NSArray* shuffledArray = [helperMock shuffleArray:originalArray];
    
    NSArray* expectedArray = @[@"b", @"c", @"d", @"a"];
    STAssertEqualObjects(shuffledArray, expectedArray, nil);
}

- (void)test_that_array_is_shuffled_correctly_when_random_number_generator_always_returns_one
{
    helperMock.fakeRandomNumberMethod = ^(NSInteger max) {
        return 1;
    };
    
    NSArray* shuffledArray = [helperMock shuffleArray:originalArray];
    
    NSArray* expectedArray = @[@"a", @"c", @"d", @"b"];
    STAssertEqualObjects(shuffledArray, expectedArray, nil);
}

- (void)test_that_array_is_shuffled_correctly_when_random_number_generator_always_returns_max
{
    helperMock.fakeRandomNumberMethod = ^(NSInteger max) {
        return max;
    };
    
    NSArray* shuffledArray = [helperMock shuffleArray:originalArray];
    
    NSArray* expectedArray = @[@"a", @"b", @"c", @"d"];
    STAssertEqualObjects(shuffledArray, expectedArray, nil);
}

- (void)test_that_array_is_shuffled_correctly_when_random_number_generator_always_returns_max_minus_one
{
    helperMock.fakeRandomNumberMethod = ^(NSInteger max) {
        return max - 1;
    };
    
    NSArray* shuffledArray = [helperMock shuffleArray:originalArray];
    
    NSArray* expectedArray = @[@"d", @"a", @"b", @"c"];
    STAssertEqualObjects(shuffledArray, expectedArray, nil);
}

- (void)test_that_firstObjectsFromArray_returns_correct_objects
{
    NSArray* expectedObjects = @[@"a", @"b"];
    NSArray* actualObjects = [helperMock first:2 objectsFromArray:originalArray];
    
    STAssertEqualObjects(actualObjects, expectedObjects, nil);
}

- (void)test_that_allButFirstObjectsFromArray_returns_correct_objects
{
    NSArray* expectedObjects = @[@"c", @"d"];
    NSArray* actualObjects = [helperMock allButFirst:2 objectsFromArray:originalArray];
    
    STAssertEqualObjects(actualObjects, expectedObjects, nil);
}

- (void)test_that_mapArray_returns_correct_array
{
    NSArray* expectedMappedArray = @[@"a2", @"b2", @"c2", @"d2"];
    NSArray* actualMappedArray = [helperMock mapArray:originalArray withBlock:^id(NSString* obj) {
        return [obj stringByAppendingString:@"2"];
    }];
    
    STAssertEqualObjects(actualMappedArray, expectedMappedArray, nil);
}

- (void)test_that_sharedInstance_factory_returns_correct_object_type
{
    WZMArrayHelper* helper = [WZMArrayHelper sharedInstance];
    
    STAssertTrue([helper isMemberOfClass:[WZMArrayHelper class]], nil);
}

- (void)test_that_two_subsequent_calls_to_sharedArrayHelper_factory_return_the_same_shared_object
{
    WZMArrayHelper* helper1 = [WZMArrayHelper sharedInstance];
    WZMArrayHelper* helper2 = [WZMArrayHelper sharedInstance];
    
    STAssertEqualObjects(helper1, helper2, nil);
}

@end
