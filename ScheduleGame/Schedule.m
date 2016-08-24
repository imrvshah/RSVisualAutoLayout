//
//  Schedule.m
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import "Schedule.h"
#import "Team.h"
#import "Game.h"
@implementation Schedule
@synthesize sectionHeader;
@synthesize scheduleGames;
+ (Schedule*)scheduleFromXML:(NSDictionary *)dict withTeam: (Team *)team
{
    Schedule *schedule = [[Schedule alloc]init];
    schedule.scheduleGames = [Game gamesFromXMLArray:[dict valueForKey:@"Game"] withTeam:team];
    schedule.sectionHeader = [dict valueForKey:@"_Heading"];
    return schedule;
    
}
+ (NSArray*)scheduleFromXMLArray:(NSArray *)arr withTeam:(Team *)team
{
    NSMutableArray *scheduleMapped = [NSMutableArray new];
    for (int i =0 ; i < arr.count; i++) {
        NSDictionary *dict = arr[i];
        Schedule *game = [Schedule scheduleFromXML:dict withTeam:team];
        [scheduleMapped addObject:game];
    }
    return scheduleMapped;
}

@end
