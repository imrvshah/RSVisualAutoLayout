//
//  Team.h
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Team : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* record;
@property (nonatomic, strong) NSString* triCode;
@property (nonatomic, strong) NSString* logo;
+ (Team*)teamFromXML:(NSDictionary *)dict;
+ (NSArray*)teamsFromXMLArray:(NSArray *)arr;
@end
