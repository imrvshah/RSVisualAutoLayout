//
//  ByeGameTableViewCell.h
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
@interface ByeGameTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel* byeLabel;
@property (nonatomic, strong) UILabel* weekLabel;
@property (strong, nonatomic)  UIImageView *lineImage;
- (void)updateCell:(Game *)game;
@end
