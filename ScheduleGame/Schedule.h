//
//  Schedule.h
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"
@interface Schedule : NSObject
@property (nonatomic, strong) NSArray *scheduleGames;
@property (nonatomic, strong) NSString *sectionHeader;

+ (NSArray*)scheduleFromXMLArray:(NSArray *)arr withTeam:(Team *)team;
@end
