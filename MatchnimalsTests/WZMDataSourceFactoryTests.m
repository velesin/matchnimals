//
//  WZMDataSourceFactoryTests.m
//  Matchnimals
//
//  Created by Wojtek on 6/27/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMDataSourceFactoryTests.h"
#include "OCMock.h"
#include "WZMPlistDataReader.h"
#include "WZMRandomizingGameControllerDataSource.h"
#import "WZMDataSourceFactory.h"

@implementation WZMDataSourceFactoryTests

- (void)test_that_factory_method_reads_data_for_the_correct_level_and_returns_correct_object_type
{
    NSInteger levelNumberFixture = 100;
    NSArray* questionAnswerPairsFixture = @[
                                            @[@"q1", @"a1"],
                                            @[@"q2", @"a2"],
                                            @[@"q3", @"a3"],
                                            @[@"q4", @"a4"],
                                            @[@"q5", @"a5"],
                                            @[@"q6", @"a6"],
                                            @[@"q7", @"a7"],
                                            @[@"q8", @"a8"]];
    
    id plistDataReaderMock = [OCMockObject mockForClass:[WZMPlistDataReader class]];
    [[[plistDataReaderMock stub] andReturn:plistDataReaderMock] sharedInstance];
    
    [[[plistDataReaderMock expect] andReturn:questionAnswerPairsFixture] questionAnswerPairsForLevel:levelNumberFixture];
    
    id dataSource = [WZMDataSourceFactory dataSourceForLevel:levelNumberFixture];
    
    STAssertTrue([dataSource isMemberOfClass:[WZMRandomizingGameControllerDataSource class]], @"factory should return WZMRandomizingGameControllerDataSource");
    [plistDataReaderMock verify];
    
    [plistDataReaderMock stopMocking];
}

@end
