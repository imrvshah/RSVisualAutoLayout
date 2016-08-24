//
//  UIImage+Logo.h
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Logo)
+ (void)fetchLogo:(NSString *)url block:(void (^)(UIImage* image))block;
@end
