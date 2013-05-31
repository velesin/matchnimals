//
//  WZMPlistDataReaderTests.m
//  Matchnimals
//
//  Created by Wojtek on 5/30/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMPlistDataReaderTests.h"
#import "OCMock.h"
#import "WZMPlistDataReader.h"

@implementation WZMPlistDataReaderTests

- (void)test_that_level_data_is_read_properly
{
    id mainBundleMock = [OCMockObject mockForClass:[NSBundle class]];
    [[[mainBundleMock stub] andReturn:[NSBundle bundleForClass:[self class]]] mainBundle];
    
    WZMPlistDataReader* reader = [[WZMPlistDataReader alloc] init];
    
    NSArray* expectedLevel1Data = @[
                                    @{@"questionImageName": @"q11",
                                      @"answerImageName": @"a11",},
                                    @{@"questionImageName": @"q12",
                                      @"answerImageName": @"a12",},
                                    @{@"questionImageName": @"q13",
                                      @"answerImageName": @"a13",},
                                    ];
    NSArray* expectedLevel2Data = @[
                                    @{@"questionImageName": @"q21",
                                      @"answerImageName": @"a21",},
                                    @{@"questionImageName": @"q22",
                                      @"answerImageName": @"a22",},
                                    ];
    NSArray* actualLevel1Data = [reader questionAnswerPairsForLevel:1];
    NSArray* actualLevel2Data = [reader questionAnswerPairsForLevel:2];
    
    STAssertEqualObjects(actualLevel1Data, expectedLevel1Data, nil);
    STAssertEqualObjects(actualLevel2Data, expectedLevel2Data, nil);
}

//test throwing exception when trying to access out of bounds level

//test if reading plist file is really cached (that the bundle method is invoked only once)

@end
