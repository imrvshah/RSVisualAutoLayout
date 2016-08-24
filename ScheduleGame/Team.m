//
//  Team.m
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import "Team.h"
#import "NSObject+JTObjectMapping.h"
@implementation Team
+ (Team*)teamFromXML:(NSDictionary *)dict
{
    NSDictionary *mapping = @{
                              @"_Name": @"name",
                              @"_Record": @"record",
                              @"_TriCode":@"triCode",
                              };
    
    Team *team = [Team objectFromJSONObject:dict mapping:mapping];
    team.logo = [NSString stringWithFormat:@"https://s3.amazonaws.com/yc-app-resources/nfl/logos/nfl_%@_light.png", [team.triCode lowercaseString]];
    return team;
}

+ (NSArray*)teamsFromXMLArray:(NSArray *)arr
{
    NSMutableArray *teamsMapped = [NSMutableArray new];
    [arr enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        if ([dict objectForKey:@"model"]) dict = [dict objectForKey:@"model"];
        
        Team *game = [Team teamFromXML:dict];
        [teamsMapped addObject:game];
    }];
    return teamsMapped;
}
@end
