//
//  WZMGameControllerDelegate.h
//  Matchnimals
//
//  Created by Wojtek on 5/27/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WZMGameRound;

@protocol WZMGameControllerDelegate <NSObject>

- (void)newRound:(WZMGameRound*)round;
- (void)gameCompleted;
- (void)wrongAnswer:(NSInteger)answerNumber;

@end
