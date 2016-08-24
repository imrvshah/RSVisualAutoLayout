//
//  ByeGameTableViewCell.m
//  ScheduleGame
//
//  Created by Ravi Shah on 8/13/16.
//  Copyright © 2016 Ravi Shah. All rights reserved.
//

#import "ByeGameTableViewCell.h"
#import "UILabel+TextLabel.h"
#import "UIFont+TextFont.h"
#import "UIColor+TextColor.h"
@interface ByeGameTableViewCell()
@end;
@implementation ByeGameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        // Configure the view for the selected state
        self.byeLabel = [[UILabel alloc]init];
        [self.byeLabel createLabelWithAlignment:NSTextAlignmentCenter labelTextColor:[UIColor grayColorFromHexString] labelTextFont:[UIFont getLargeMavenBold]];
        
        self.weekLabel = [[UILabel alloc]init];
        [self.weekLabel createLabelWithAlignment:NSTextAlignmentRight labelTextColor:[UIColor grayColorFromHexString] labelTextFont:[UIFont getExtraSmallMavenPro]];
        
        self.lineImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list_divider"]];
        self.lineImage.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.lineImage.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:self.byeLabel];
        [self.contentView addSubview:self.weekLabel];
        [self.contentView addSubview:self.lineImage];
    }
    return self;
}
- (void)updateCell:(Game *)game
{
    self.byeLabel.text = @"BYE";
    self.weekLabel.text = [NSString stringWithFormat:@"Week %@",game.label];
    //     [self updateConstraints];
}
- (void)updateConstraints
{
    NSMutableArray<NSLayoutConstraint*> *layoutContraints = [[NSMutableArray alloc] init];
    [layoutContraints addObject:[self.byeLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor]];
    [layoutContraints addObject:[self.byeLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor]];
    
    [layoutContraints addObject:[self.weekLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor]];
    [layoutContraints addObject:[self.weekLabel.topAnchor constraintEqualToAnchor:self.byeLabel.bottomAnchor constant:0]];
    
    
    [NSLayoutConstraint activateConstraints:layoutContraints];
    
    [super updateConstraints];
    
}
@end
