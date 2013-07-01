//
//  WZMArrayRandomizer.h
//  Matchnimals
//
//  Created by Wojtek on 5/28/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZMArrayHelper : NSObject

+ (WZMArrayHelper*)sharedInstance;

- (NSArray*)shuffleArray:(NSArray*)array;
- (NSArray*)first:(NSInteger)numberOfObjectsToReturn objectsFromArray:(NSArray*)array;
- (NSArray*)allButFirst:(NSInteger)numberOfObjectsToSkip objectsFromArray:(NSArray*)array;
- (NSArray*)mapArray:(NSArray*)array withBlock:(id (^)(id))block;

@end
