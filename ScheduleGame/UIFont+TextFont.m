//
//  UIFont+TextFont.m
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import "UIFont+TextFont.h"
static NSString* kLeagueGothic = @"LeagueGothic-Regular";
static NSInteger kSmallLeagueGothic = 20;
static NSInteger kExtraSmallLeagueGothic = 14;
static NSInteger kLargeLeagueGothic = 30;
static NSString* kMavenProRegular = @"MavenProRegular";
static NSInteger kExtraSmallMavenPro = 14;
static NSInteger ksmallMavenPro = 30;
static NSInteger kLargeMavenPro = 50;
static NSString* kMavenBold = @"MavenProBold";
static NSInteger kSmallSystem = 14;
static NSInteger kLargeSystem = 50;

static NSString* kGrayColor =  @"#999999";
@implementation UIFont (TextFont)

+ (UIFont *)getSmallLeagueGothic
{
    return [UIFont fontWithName:kLeagueGothic size:kSmallLeagueGothic];
}

+ (UIFont *)getLargeLeagueGothic
{
    return [UIFont fontWithName:kLeagueGothic size:kLargeLeagueGothic];
}

+ (UIFont *)getExtraSmallLeagueGothic
{
    return [UIFont fontWithName:kLeagueGothic size:kExtraSmallLeagueGothic];
}

+ (UIFont *)getExtraSmallMavenPro
{
    return [UIFont fontWithName:kMavenProRegular size:kExtraSmallMavenPro];
}

+ (UIFont *)getSmallMavenPro
{
    return [UIFont fontWithName:kMavenProRegular size:ksmallMavenPro];
}


+ (UIFont *)getLargeMavenPro
{
    return [UIFont fontWithName:kMavenProRegular size:kLargeMavenPro];
}

+ (UIFont *)getSmallMavenBold
{
    return [UIFont fontWithName:kMavenBold size:kSmallSystem];
}

+ (UIFont *)getLargeMavenBold
{
    return [UIFont fontWithName:kMavenBold size:kLargeSystem];
}
@end
