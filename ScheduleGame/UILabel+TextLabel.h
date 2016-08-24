//
//  UILabel+TextLabel.h
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TextLabel)
- (UILabel *)createLabelWithAlignment:(NSTextAlignment)alignment
                       labelTextColor:(UIColor *)color
                        labelTextFont:(UIFont *)font;
@end
