//
//  UIColor+TextColor.m
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import "UIColor+TextColor.h"
static NSString* kBlackColor = @"#000000";
static NSString* kGrayColor =  @"#999999";
static NSString* kLightGrayColor =  @"#E6E6E6";
static NSString* kBottleGreenColor =  @"#134F58";
@implementation UIColor (TextColor)

+ (UIColor *)blackColorFromHexString
{
    return [self getColorFromHexString:kBlackColor];
}

+ (UIColor *)grayColorFromHexString
{
    return [self getColorFromHexString:kGrayColor];
}

+ (UIColor *)lightGrayColorFromHexString
{
    return [self getColorFromHexString:kLightGrayColor];
}

+ (UIColor *)bottleGreenColorFromHexString
{
    return [self getColorFromHexString:kBottleGreenColor];
}

+ (UIColor *)getColorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
@end
