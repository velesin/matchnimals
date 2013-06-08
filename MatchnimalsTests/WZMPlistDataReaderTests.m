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
                                    @[@"q11", @"a11"],
                                    @[@"q12", @"a12"],
                                    @[@"q13", @"a13"],
                                    ];
    NSArray* expectedLevel2Data = @[
                                    @[@"q21", @"a21"],
                                    @[@"q22", @"a22"],
                                    ];
    
    NSArray* actualLevel1Data = [reader questionAnswerPairsForLevel:1];
    NSArray* actualLevel2Data = [reader questionAnswerPairsForLevel:2];
    
    STAssertEqualObjects(actualLevel1Data, expectedLevel1Data, nil);
    STAssertEqualObjects(actualLevel2Data, expectedLevel2Data, nil);
}

//test throwing exception when trying to access out of bounds level

//test if reading plist file is really cached (that the bundle method is invoked only once)

@end
