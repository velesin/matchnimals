//
//  WZMGamePlayRound.h
//  Matchnimals
//
//  Created by Wojtek on 5/11/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZMGameRound : NSObject

@property (nonatomic, readonly) NSInteger roundNumber;
@property (nonatomic, retain, readonly) NSString* questionImageName;
@property (nonatomic, retain, readonly) NSArray* answerImageNames;
@property (nonatomic, readonly) NSInteger correctAnswerNumber;

- (id)initWithRoundNumber:(NSInteger)roundNumber
        questionImageName:(NSString*)questionImageName
         answerImageNames:(NSArray*)answerImageNames
      correctAnswerNumber:(NSInteger)correctAnswerNumber;

- (NSString*)imageNameForAnswer:(NSInteger)answerNumber;

@end
