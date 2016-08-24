//
//  Game.h
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"
@interface Game : NSObject
@property (nonatomic, strong) Team *opponent;
@property (nonatomic, strong) Team *first;
@property (nonatomic) double gameId;
@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSString *seasonWeek;
@property (nonatomic, strong) NSString *matchType;
@property (nonatomic, strong) NSString *matchResult;
@property (nonatomic, strong) NSDate *matchDate;
@property (nonatomic, strong) NSString *matchTime;
@property (nonatomic, strong) NSString *broadcastChannel;

+ (NSArray*)gamesFromXMLArray:(NSArray *)arr withTeam:(Team *)team;
@end
