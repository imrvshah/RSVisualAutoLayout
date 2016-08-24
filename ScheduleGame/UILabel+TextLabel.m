//
//  UILabel+TextLabel.m
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import "UILabel+TextLabel.h"

@implementation UILabel (TextLabel)

- (UILabel *)createLabelWithAlignment:(NSTextAlignment)alignment
                       labelTextColor:(UIColor *)color
                        labelTextFont:(UIFont *)font

{
    self.textAlignment = alignment;
    self.textColor = color;
    self.font = font;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return self;
}
@end
