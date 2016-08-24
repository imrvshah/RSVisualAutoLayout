//
//  FinishedTableViewCell.h
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
@interface FinishedGameTableViewCell : UITableViewCell
@property (strong, nonatomic)  UILabel *teamFirstName;
@property (strong, nonatomic)  UILabel *teamFirstScore;
@property (strong, nonatomic)  UIImageView *teamFirstImage;
@property (strong, nonatomic)  UILabel *teamOpponentName;
@property (strong, nonatomic)  UILabel *teamOpponentScore;
@property (strong, nonatomic)  UIImageView *teamOpponentImage;
@property (strong, nonatomic)  UILabel *atLabel;
@property (strong, nonatomic)  UILabel *matchDate;
@property (strong, nonatomic)  UILabel *seasonWeek;
@property (strong, nonatomic)  UILabel *matchType;
@property (strong, nonatomic)  UIImageView *lineImage;
- (void)updateCell:(Game *)game;
@end
