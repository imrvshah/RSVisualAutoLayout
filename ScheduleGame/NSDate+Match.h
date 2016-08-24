//
//  NSDate+Match.h
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Match)
+ (NSDate *)convertTime:(NSString *)gamedate;
+ (NSString *)convertDateToDay:(NSDate *)gamedate;
+ (NSString *)convertDateToTime:(NSDate *)gamedate;
@end
