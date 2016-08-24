//
//  Game.m
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import "Game.h"
#import "NSObject+JTObjectMapping.h"
#import "NSDate+Match.h"
@implementation Game
+ (Game*)gameFromXML:(NSDictionary *)dict withTeam:(Team *)team
{
    NSDictionary *mapping = @{
                              @"_Id": @"gameId",
                              @"_Week": @"seasonWeek",
                              @"_Type":@"matchType",
                              @"_TV":@"broadcastChannel",
                              @"_Result":@"matchResult",
                              };
    
    Game *game = [Game objectFromJSONObject:dict mapping:mapping];
    game.opponent = [Team teamFromXML:dict[@"Opponent"]];
    game.matchDate = [NSDate convertTime:[dict valueForKeyPath: @"Date._Timestamp"]];
    game.first = team;
    return game;
}

+ (NSArray*)gamesFromXMLArray:(NSArray *)arr withTeam:(Team *)team
{
    NSMutableArray *gamesMapped = [NSMutableArray new];
    for (int i=0 ; i<arr.count; i++) {
        NSDictionary *dict = arr[i];
        Game *game = [Game gameFromXML:dict withTeam:team];
        [gamesMapped addObject:game];
    }
    return gamesMapped;
}
@end
