//
//  WZMGameControllerDataSource.h
//  Matchnimals
//
//  Created by Wojtek on 5/27/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WZMGameControllerDataSource <NSObject>

- (NSArray*)roundsForNewGame;

@end
