//
//  UIImage+Logo.m
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import "UIImage+Logo.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
@implementation UIImage (Logo)
+ (void)fetchLogo:(NSString *)url block:(void (^)(UIImage* image))block
{
    __block  NSData *imgData;
    __block  UIImage *image;
    dispatch_async(kBgQueue, ^{
        imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            image = [UIImage imageWithData:imgData];
            block(image);
        });
    });
    
}
@end
