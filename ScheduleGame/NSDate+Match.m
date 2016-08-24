//
//  NSDate+Match.m
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import "NSDate+Match.h"

@implementation NSDate (Match)

+ (NSDate *)convertTime:(NSString *)gamedate
{
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSLocale *posix = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [df setLocale:posix];
    NSDate* date = [df dateFromString:gamedate];
    return date;
}

+ (NSString *)convertDateToDay:(NSDate *)gamedate
{
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"E, MMM d"];
    df.timeZone = [NSTimeZone localTimeZone];
    return [df stringFromDate:gamedate];
}

+ (NSString *)convertDateToTime:(NSDate *)gamedate
{
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"h:mm a"];
    df.timeZone = [NSTimeZone localTimeZone];
    return [df stringFromDate:gamedate];
}

@end
