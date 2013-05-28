//
//  WZMDataTests.m
//  Matchnimals
//
//  Created by Wojtek on 5/7/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMDataTests.h"

@implementation WZMDataTests
{
    NSArray* creditsPlist;
}

- (void)setUp
{
    [super setUp];
    NSString* creditsPlistPath = [[NSBundle mainBundle] pathForResource:@"Credits" ofType:@"plist"];
//    NSString* creditsPlistPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestData" ofType:@"plist"];
    creditsPlist = [NSArray arrayWithContentsOfFile:creditsPlistPath];
}

- (void)test_that_Credits_plist_exists
{
    STAssertNotNil(creditsPlist, @"Credits.plist does not exist under expected location");
}

//STAssertTrue([[topic recentQuestions] isKindOfClass:
//[NSArray class]],
//@"Topics should provide a list of recent questions");

@end
