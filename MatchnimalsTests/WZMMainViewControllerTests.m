//
//  WZMMainViewControllerTests.m
//  Matchnimals
//
//  Created by Wojtek on 6/20/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMMainViewControllerTests.h"
#import "OCMock.h"
#import "WZMMainViewController.h"
#import "WZMGamePlayViewController.h"
#import "WZMRandomizingGameControllerDataSource.h"
#import "WZMDataSourceFactory.h"
#import "WZMGameController.h"

@implementation WZMMainViewControllerTests
{
    WZMMainViewController* controller;
    id dataSourceForFirstLevelMock;
//    id dataSourceForSecondLevelMock;
    id dataSourceFactoryMock;
    WZMGamePlayViewController* gamePlayViewController;
    UIImageView* firstLevelImage;
    UIStoryboardSegue* segue;
}

- (void)setUp{
    controller = [[WZMMainViewController alloc] init];
    
    dataSourceForFirstLevelMock = [OCMockObject mockForClass:[WZMRandomizingGameControllerDataSource class]];
    
    dataSourceFactoryMock = [OCMockObject mockForClass:[WZMDataSourceFactory class]];
    [[[dataSourceFactoryMock stub] andReturn:dataSourceForFirstLevelMock] dataSourceForLevel:1];
    
    gamePlayViewController = [[WZMGamePlayViewController alloc] init];
    
    firstLevelImage = [[UIImageView alloc] init];
    firstLevelImage.tag = 1;
    
    segue = [[UIStoryboardSegue alloc] initWithIdentifier:@"GamePlay" source:controller destination:gamePlayViewController];
}

- (void)test_that_game_play_view_controller_has_game_controller_properly_assigned
{
    [controller prepareForSegue:segue sender:firstLevelImage];
    
    id gameController = gamePlayViewController.gameController;
    STAssertTrue([gameController isMemberOfClass:[WZMGameController class]], nil);
}

- (void)test_that_game_controller_has_data_source_properly_assigned
{
    [controller prepareForSegue:segue sender:firstLevelImage];
    
    WZMGameController* gameController = gamePlayViewController.gameController;    
    STAssertEqualObjects(gameController.dataSource, dataSourceForFirstLevelMock, nil);
}

- (void)test_that_game_controller_has_game_play_view_controller_assigned_as_delegate
{
    [controller prepareForSegue:segue sender:firstLevelImage];
    
    WZMGameController* gameController = gamePlayViewController.gameController;
    STAssertEqualObjects(gameController.delegate, gamePlayViewController, nil);
}

- (void)test_that_level_numbers_are_properly_distinguished_when_creating_data_source
{
    id dataSourceForSecondLevelMock = [OCMockObject mockForClass:[WZMRandomizingGameControllerDataSource class]];
    [[[dataSourceFactoryMock stub] andReturn:dataSourceForSecondLevelMock] dataSourceForLevel:2];
    
    UIImageView* secondLevelImage = [[UIImageView alloc] init];
    secondLevelImage.tag = 2;
    
    [controller prepareForSegue:segue sender:secondLevelImage];
    
    WZMGameController* gameController = gamePlayViewController.gameController;
    STAssertEqualObjects(gameController.dataSource, dataSourceForSecondLevelMock, nil);
}

//behavior is triggered only by a proper segue identifier

@end
