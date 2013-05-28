//
//  WZMGameController.h
//  Matchnimals
//
//  Created by Wojtek on 5/27/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZMGameControllerDataSource.h"
#import "WZMGameControllerDelegate.h"

@interface WZMGameController : NSObject

@property id<WZMGameControllerDataSource> dataSource;
@property id<WZMGameControllerDelegate> delegate;

- (void)startNewGame;
- (void)giveAnswerWithNumber:(NSInteger)answerNumber;

@end
