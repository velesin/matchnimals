//
//  WZMDataSourceFactory.h
//  Matchnimals
//
//  Created by Wojtek on 6/27/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZMGameControllerDataSource.h"

@interface WZMDataSourceFactory : NSObject

+ (id<WZMGameControllerDataSource>)dataSourceForLevel:(NSInteger)levelNumber;

@end
