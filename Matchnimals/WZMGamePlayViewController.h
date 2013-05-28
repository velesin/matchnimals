//
//  WZMGamePlayViewController.h
//  Matchnimals
//
//  Created by Wojtek on 4/23/13.
//  Copyright (c) 2013 Wojciech Zawistowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZMGamePlayDataSource.h"

@interface WZMGamePlayViewController : UIViewController

@property id<WZMGamePlayDataSource> dataSource;

- (IBAction)answer:(id)sender;

@end
