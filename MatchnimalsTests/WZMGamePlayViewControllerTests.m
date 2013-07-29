//
//  WZMGamePlayViewControllerTests.m
//  Matchnimals
//
//  Created by Wojtek on 5/9/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import "WZMGamePlayViewControllerTests.h"
#import "OCMock.h"
#import "WZMGameRound.h"
#import "WZMGamePlayViewController.h"

@implementation WZMGamePlayViewControllerTests
{
    WZMGamePlayViewController* controller;
}

//- (void)setUp
//{
//    [super setUp];
//    
//    NSArray* round1AnswerImageNames = @[@"a11", @"a12", @"a13"];
//    round1 = [[WZMGameRound alloc] initWithQuestionImageName:@"q1"
//                                               answersImageNames:round1AnswerImageNames
//                                             correctAnswerNumber:1];
//    
//    NSArray* round2AnswerImageNames = @[@"a21", @"a22", @"a23"];
//    round2 = [[WZMGameRound alloc] initWithQuestionImageName:@"q2"
//                                               answersImageNames:round2AnswerImageNames
//                                             correctAnswerNumber:3];
//    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
//    controller = [storyboard instantiateViewControllerWithIdentifier:@"GamePlayViewController"];
//    
//    id gamePlayDataSourceMock = [OCMockObject mockForProtocol:@protocol(WZMGamePlayDataSource)];
//    [[[gamePlayDataSourceMock stub] andReturn:@[round1, round2]] drawNewSetOfRounds];
//
//    id mainBundleMock = [OCMockObject mockForClass:[NSBundle class]];
//    [[[mainBundleMock stub] andReturn:[NSBundle bundleForClass:[self class]]] mainBundle];
//    
//    controller.dataSource = gamePlayDataSourceMock;
//}
//
//#pragma mark - tests
//
//- (void)test_that_controller_displays_first_round_images_when_loaded
//{
//    STAssertTrue([self controllerDisplaysQuestionImageForRound:round1], @"initial question image is incorrect");
//    STAssertTrue([self controllerDisplaysAnswerImagesForRound:round1], @"initial question images are incorrect");
//}
//
//- (void)test_that_controller_displays_next_round_images_when_round_is_answered_correctly
//{
//    [controller answer:[[controller view] viewWithTag:1]];
//    
//    STAssertTrue([self controllerDisplaysQuestionImageForRound:round2], @"question image is incorrect");
//    STAssertTrue([self controllerDisplaysAnswerImagesForRound:round2], @"answer images are incorrect");
//}
//
//- (void)test_that_controller_stays_on_the_same_round_images_when_round_is_answered_incorrectly
//{
//    [controller answer:[[controller view] viewWithTag:2]];
//    
//    STAssertTrue([self controllerDisplaysQuestionImageForRound:round1], @"question image is incorrect");
//    STAssertTrue([self controllerDisplaysAnswerImagesForRound:round1], @"answer images are incorrect");
//}
//
//#pragma mark - helper methods
//
//- (UIImage*)expectedImage:(NSString*)imageName
//{
//    NSString* imagePath = [[NSBundle bundleForClass:[self class]] pathForResource:imageName ofType:@"jpg" inDirectory:@"Images"];
//    return [UIImage imageWithContentsOfFile:imagePath];
//}
//
//- (UIImage*)actualImage:(NSInteger)tag
//{
//    UIImageView* imageView = (UIImageView*)[[controller view] viewWithTag:tag];
//    return [imageView image];
//}
//
//- (UIImage*)actualImageForQuestion
//{
//    return [self actualImage: 100];
//}
//
//- (UIImage*)actualImageForAnswer:(NSInteger)number
//{
//    return [self actualImage: number];
//}
//
//- (BOOL)identicalImages:(UIImage*)actual and:(UIImage*)expected
//{
//    NSData* actualData = UIImagePNGRepresentation(actual);    
//    NSData* expectedData = UIImagePNGRepresentation(expected);
//    
//    return [actualData isEqualToData:expectedData];
//}
//
//- (BOOL)controllerDisplaysQuestionImageForRound:(WZMGameRound*)round
//{
//    return [self identicalImages:[self actualImageForQuestion] and:[self expectedImage:[round imageNameForQuestion]]];
//}
//
//- (BOOL)controllerDisplaysAnswerImagesForRound:(WZMGameRound*)round
//{
//    return [self identicalImages:[self actualImageForAnswer:1] and:[self expectedImage:[round imageNameForAnswer:1]]]
//            && [self identicalImages:[self actualImageForAnswer:2] and:[self expectedImage:[round imageNameForAnswer:2]]]
//            && [self identicalImages:[self actualImageForAnswer:3] and:[self expectedImage:[round imageNameForAnswer:3]]];
//}

@end
